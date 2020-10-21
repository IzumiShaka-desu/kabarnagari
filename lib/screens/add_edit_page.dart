import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kabarnagari/models/kategori.dart';
import 'package:kabarnagari/models/news.dart';
import 'package:kabarnagari/service/network_service.dart';
import 'package:kabarnagari/service/sharepref_service.dart';
import 'package:kabarnagari/util.dart';
import 'package:line_icons/line_icons.dart';

class AddEditNews extends StatefulWidget {
  AddEditNews({this.news});
  final News news;
  @override
  _AddEditNewsState createState() => _AddEditNewsState();
}

class _AddEditNewsState extends State<AddEditNews> {
  Map<String, TextEditingController> _controller = {
    'title': TextEditingController(),
    'kontenBerita': TextEditingController()
  };
  int selectedKategori;
  List<DropdownMenuItem<int>> itemKategoriList = [];
  List<Kategori> kategoriList;
  PickedFile images;
  GlobalKey<ScaffoldState> _sk = GlobalKey<ScaffoldState>();
  bool isLoading = false;

  @override
  void initState() {
    initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _sk,
      appBar: AppBar(actions: [
        IconButton(
          icon: Icon(LineIcons.save),
          onPressed: () => (isLoading) ? null : saveData(),
        ),
        Transform.scale(
          scale: (widget.news == null) ? 0 : 1,
          child: IconButton(
            icon: Icon(LineIcons.trash_o),
            onPressed: () => (isLoading) ? null : deleteData(),
          ),
        )
      ], title: Text((widget.news == null) ? 'buat berita' : 'edit berita')),
      body: FutureBuilder<List<Kategori>>(
        future: NetworkService().getKategoriList(),
        builder: (ctx, snapshot) {
          if (snapshot.hasData&& snapshot.data.length>0) {
            List<Kategori> result = snapshot.data;
            kategoriList = result;
            itemKategoriList = kategoriList
                .map((e) => DropdownMenuItem(
                    value: int.tryParse(e.idKategori),
                    child: Text(e.namaKategori)))
                .toList();
            selectedKategori = int.tryParse(result.first.idKategori);
          }
          return (snapshot.hasError)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  child: (isLoading)
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : SingleChildScrollView(
                          child: Container(
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: InkWell(
                                  onTap: () => selectImage(),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.grey)),
                                    height: 100,
                                    width: 100,
                                    child: (images != null)
                                        ? Image.file(File(images.path),
                                            fit: BoxFit.cover)
                                        : Icon(
                                            LineIcons.camera_retro,
                                            size: 30,
                                          ),
                                  ),
                                ),
                              ),
                              createTextField(_controller['title'],
                                  "judul berita", Icon(LineIcons.newspaper_o)),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: DropdownButton<int>(
                                    onChanged: (value) {
                                      setState(() {
                                        selectedKategori = value;
                                      });
                                    },
                                    value: selectedKategori,
                                    items: itemKategoriList),
                              ),
                              createTextField(_controller['kontenBerita'],
                                  'konten berita', Icon(LineIcons.file_text_o),
                                  maxline: 8),
                            ],
                          ),
                        )),
                );
        },
      ),
    );
  }

  selectImage() async {
    _sk.currentState.showBottomSheet(
        (context) => Container(
            padding: EdgeInsets.all(10),
            height: 130,
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  children: [
                    Text('ambil gambar dari '),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        IconButton(
                            icon: Icon(LineIcons.image),
                            onPressed: () async {
                              try {
                                PickedFile _images = await ImagePicker()
                                    .getImage(source: ImageSource.gallery);
                                setState(() {
                                  images = _images;
                                });
                              } catch (e) {
                                debugPrint(e.toString());
                              }
                              Navigator.of(context).pop();
                            }),
                        Text('gallery')
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      children: [
                        IconButton(
                            icon: Icon(LineIcons.camera),
                            onPressed: () async {
                              try {
                                PickedFile _images = await ImagePicker()
                                    .getImage(source: ImageSource.camera);
                                setState(() {
                                  images = _images;
                                });
                              } catch (e) {
                                debugPrint(e.toString());
                              }
                              Navigator.of(context).pop();
                            }),
                        Text('camera')
                      ],
                    )
                  ],
                ),
              ],
            )),
        elevation: 20,
        backgroundColor: Colors.grey[100]);
  }

  initData() async {
    setState(() {
      if (widget.news != null) {
        _controller['title'].text = widget.news.title;
        _controller['kontenBerita'].text = widget.news.kontenBerita;
        selectedKategori = int.tryParse(widget.news.idUser);
      }
    });
  }

  saveData() async {
    setState(() {
      isLoading = true;
    });
    bool result = false;
    if (checkNullTextController(_controller)) {
      _sk.currentState.showSnackBar(createSnackbar('form tidak boleh kosong'));
    } else if (widget.news != null) {
      try {
        Map<String, String> json = {};
        json['title'] = _controller['title'].text;
        json['id_kategori'] = selectedKategori.toString();

        json['foto'] = widget.news.foto;
        json['id_user'] =
            (await SPrefService().getLoginDetails())['idUser'].toString();
        json['konten_berita'] = _controller['kontenBerita'].text;
        if (images == null) {
          result = await NetworkService()
              .editNews(int.tryParse(widget.news.idBerita), json);
        } else {
          result = await NetworkService().editNews(
              int.tryParse(widget.news.idBerita), json,
              images: File(images.path));
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    } else {
      if (images == null) {
        _sk.currentState
            .showSnackBar(createSnackbar('gambar tidak boleh kosong'));
      } else {
        Map<String, String> json = {};
        json['title'] = _controller['title'].text;
        json['id_kategori'] = selectedKategori.toString();
        json['id_user'] =
            (await SPrefService().getLoginDetails())['idUser'].toString();
        json['konten_berita'] = _controller['kontenBerita'].text;
        result = await NetworkService().addNews(json, File(images.path));
      }
    }
    if (result) {
      _sk.currentState.showSnackBar(createSnackbar('berhasil menyimpan data'));
      Timer(Duration(seconds: 3), () async {
        Navigator.of(context).popUntil((route) => route.isFirst);
      });
    } else {
      _sk.currentState.showSnackBar(createSnackbar('gagal menyimpan data'));
    }
    setState(() {
      isLoading = false;
    });
  }

  deleteData() async {
    bool willDelete = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text('peringatan'),
              content: Text('apakah anda yakin akan menghapus berita ini?'),
              actions: [
                FlatButton(
                    color: Colors.blue,
                    child: Text('batal'),
                    onPressed: () => Navigator.of(ctx).pop(false)),
                FlatButton(
                    color: Colors.redAccent,
                    child: Row(
                      children: [
                        Icon(LineIcons.trash_o),
                        Text('ya, hapus'),
                      ],
                    ),
                    onPressed: () => Navigator.of(ctx).pop(true))
              ],
            ));
    if (willDelete) {
      setState(() {
        isLoading = true;
      });
      bool result = false;
      if (widget.news.idBerita != null) {
        try {
          result = await NetworkService()
              .deleteNews((int.tryParse(widget.news.idBerita)));
        } catch (e) {
          debugPrint(e.toString());
        }
      }
      if (result ?? false) {
        _sk.currentState
            .showSnackBar(createSnackbar('berhasil menghapus data'));
        Timer(Duration(seconds: 3), () {
          Navigator.of(context).popUntil((route) => route.isFirst);
        });
      } else {
        _sk.currentState.showSnackBar(createSnackbar('gagal menghapus data'));
      }
      setState(() {
        isLoading = false;
      });
    }
  }
}
