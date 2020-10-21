
import 'dart:convert';

import 'package:kabarnagari/constants.dart';

News newsFromJson(String str) => News.fromJson(json.decode(str));

String newsToJson(News data) => json.encode(data.toJson());

class News {
    News({
        this.idBerita,
        this.foto,
        this.title,
        this.idUser,
        this.tanggalDibuat,
        this.kontenBerita,
        this.namaKategori,
        this.namaAuthor,
    });

    String idBerita;
    String foto;
    String title;
    String idUser;
    DateTime tanggalDibuat;
    String kontenBerita;
    String namaKategori;
    String namaAuthor;
    List<String> bulan=['Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September','Oktober','November','Desember'];
    
    get dateString =>" ${tanggalDibuat.day.toString()} ${bulan[tanggalDibuat.month]} ${tanggalDibuat.year}";
    get urlImage =>BASEURLImage+foto;
    factory News.fromJson(Map<String, dynamic> json) => News(
        idBerita: json["id_berita"],
        foto: json["foto"],
        title: json["title"],
        idUser: json["id_user"],
        tanggalDibuat: DateTime.parse(json["tanggal_dibuat"]),
        kontenBerita: json["konten_berita"],
        namaKategori: json["nama_kategori"],
        namaAuthor: json["nama_Author"],
    );

    Map<String, dynamic> toJson() => {
        "id_berita": idBerita,
        "foto": foto,
        "title": title,
        "id_user": idUser,
        "tanggal_dibuat": "${tanggalDibuat.year.toString().padLeft(4, '0')}-${tanggalDibuat.month.toString().padLeft(2, '0')}-${tanggalDibuat.day.toString().padLeft(2, '0')}",
        "konten_berita": kontenBerita,
        "nama_kategori": namaKategori,
        "nama_Author": namaAuthor,
    };
}
