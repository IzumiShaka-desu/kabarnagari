import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kabarnagari/constants.dart';
import 'package:kabarnagari/models/profile.dart';
import 'package:kabarnagari/provider/auth_provider.dart';
import 'package:kabarnagari/service/network_service.dart';
import 'package:provider/provider.dart';

import '../util.dart';

class ProfileTab extends StatefulWidget {
  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  List<Widget> form = [];
  final Map<String, Map<String, dynamic>> _element = {
    'nama': {
      'label': 'nama',
      'controller': TextEditingController(),
      'isEdit': false
    },
    'phone': {
      'label': 'nomor telepon',
      'controller': TextEditingController(),
      'isEdit': false
    },
    'pekerjaan': {
      'label': 'pekerjaan',
      'controller': TextEditingController(),
      'isEdit': false
    }
  };
  bool isEdit = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: LayoutBuilder(
      builder: (context, constraint) =>
          Consumer<AuthProvider>(builder: (ctx, authProv, _) {
        if (authProv.loginStatus) {
          initWidget(authProv);
        }
        return Container(
          constraints: constraint,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: (authProv.loginStatus)
                    ? SingleChildScrollView(
                                          child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(children: form)),
                    )
                    : Container(),
              ),
              Container(
                color: Colors.red,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                      onTap: () async {
                        bool willLogout = await showDialog<bool>(
                            context: context,
                            builder: (ctx) => AlertDialog(
                                  title: Text('peringatan'),
                                  content: Text('yakin akan logout?'),
                                  actions: [
                                    FlatButton(
                                      color: Colors.blue,
                                        onPressed: () =>
                                            Navigator.of(context).pop(false),
                                        child: Text('tidak')),
                                        FlatButton(
                                          color: Colors.redAccent,
                                        onPressed: () =>
                                            Navigator.of(context).pop(true),
                                        child: Text('ya'))
                                  ],
                                ));
                        if(willLogout??false)authProv.logOut();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'logout',
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.exit_to_app_sharp,
                              color: bgWhite,
                            )
                          ],
                        ),
                      )),
                ),
              ),
            ],
          ),
        );
      }),
    ));
  }

  initWidget(AuthProvider authProv) {
    {
      _element['nama']['controller'].text = authProv.profile.nama ?? ' ';
      _element['phone']['controller'].text = authProv.profile.phone ?? ' ';
      _element['pekerjaan']['controller'].text =
          authProv.profile.pekerjaan ?? ' ';
    }
    List<Widget> widgets = [];
    widgets.addAll([
      CircleAvatar(
        maxRadius: 50,
      ),
      Container(
          padding: EdgeInsets.all(10),
          child: Text(
            authProv.email,
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
    ]);
    _element.forEach((key, value) {
      widgets.add(Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: value['controller'],
              enabled: value['isEdit'],
              decoration: InputDecoration(labelText: value['label']),
              keyboardType:
                  (key == 'phone') ? TextInputType.phone : TextInputType.text,
            ),
          ),
          IconButton(
              icon: (_element[key]['isEdit'])
                  ? Icon(Icons.save)
                  : Icon(Icons.edit),
              onPressed: () async {
                if (_element[key]['isEdit']) {
                  Profile profile = Profile.fromJson({
                    key: value['controller'].text,
                    'id_user': authProv.uid.toString()
                  });

                  bool result =
                      (await NetworkService().updateProfil(profile)) ?? false;
                  authProv.loadLoginStatus();
                  Scaffold.of(context).showSnackBar(createSnackbar(
                      key + " ${(result) ? 'berhasil' : 'gagal'} di ubah"));
                }
                setState(() {
                  _element[key]['isEdit'] = !_element[key]['isEdit'];
                });
              }),
        ],
      ));
    });
    form = widgets;
  }
}
