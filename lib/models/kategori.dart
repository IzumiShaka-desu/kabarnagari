import 'dart:convert';

Kategori kategoriFromJson(String str) => Kategori.fromJson(json.decode(str));

String kategoriToJson(Kategori data) => json.encode(data.toJson());

class Kategori {
    Kategori({
        this.idKategori,
        this.namaKategori,
    });

    String idKategori;
    String namaKategori;

    factory Kategori.fromJson(Map<String, dynamic> json) => Kategori(
        idKategori: json["id_kategori"],
        namaKategori: json["nama_kategori"],
    );

    Map<String, dynamic> toJson() => {
        "id_kategori": idKategori,
        "nama_kategori": namaKategori,
    };
    List<Kategori> listFromJson(String json){
      List results=jsonDecode(json);
     return List<Kategori>.from(results.map<Kategori>((e) => Kategori.fromJson(e)));
    }
}