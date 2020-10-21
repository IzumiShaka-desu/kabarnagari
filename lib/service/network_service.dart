import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:kabarnagari/models/kategori.dart';
import 'package:kabarnagari/models/news.dart';
import 'package:kabarnagari/models/profile.dart';

abstract class BaseService {
  Future<List<News>> getNews({bool isRekomended = false});
  Future<Map> login(String email, String password);
  Future<Map> register(String email, String password);
  Future<bool> addNews(Map<String, String> news, File images);
  Future<bool> deleteNews(int idNews);
  Future<bool> editNews(int id, Map<String, String> news, {File images});
  Future<bool> updateProfil(Profile profile);
  Future<Profile> getProfile(int idUser);
  Future<List<Kategori>> getKategoriList();
}

class NetworkService extends BaseService {
  static const String BASEURL = "http://192.168.43.150/";
  static const String NEWSPATH = "news/";
  static const String HOTNEWSPATH = "hotnews/";
  static const String LOGINPATH = "auth/login";
  static const String REGISTERPATH = "auth/register";
  static const String KATEGORIPATH = "kategori/";
  final headersUpload = {"Content-Type": "multipart/form-data"};
  var client = http.Client();

  @override
  Future<List<News>> getNews({bool isRekomended = false}) async {
    String url = BASEURL + ((isRekomended) ? HOTNEWSPATH : NEWSPATH);
    List<News> data = [];
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body) as List;
      result.forEach((element) {
        data.add(News.fromJson(element));
      });
    }
    return data;
  }

  @override
  Future<Map> login(String email, String password) async {
    var data = {"email": email, "password": password};
    var result = {'result': false, 'message': 'login gagal'};
    String url = BASEURL + LOGINPATH;
    var response = await client.post(url, body: data);
    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body) as Map;

      result = json['data'];
    }

    return result;
  }

  @override
  Future<Map> register(String email, String password) async {
    var data = {"email": email, "password": password};
    var result = {"result": false, "message": "register gagal"};
    String url = BASEURL + REGISTERPATH;
    var response = await client.post(url, body: data);
    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body) as Map;
      result = json['data'];
    }
    return result;
  }

  @override
  Future<bool> addNews(Map<String, String> news, File image) async {
    String url = BASEURL + NEWSPATH + "create";
    var file = await http.MultipartFile.fromPath('image', image.path,
        filename: image.path.split('/').last,
        contentType: MediaType('image', 'png'));
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request..fields.addAll(news);
    request.files.add(file);
    var response = await request.send();
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  @override
  Future<bool> deleteNews(int idNews) async {
    String url = BASEURL + NEWSPATH + "delete";

    var response =
        await client.post(url, body: {'id_berita': idNews.toString()});
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      return !result['error'];
    }
    return false;
  }

  @override
  Future<bool> editNews(int id, Map<String, String> news, {File images}) async {
    String url = BASEURL + NEWSPATH + "$id/edit";
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request..fields.addAll(news);
    if (images != null) {
      var file = await http.MultipartFile.fromPath('image', images.path,
          filename: images.path.split('/').last,
          contentType: MediaType('image', 'png'));
      request..files.add(file);
    }

    var response = await request.send();
    if (response.statusCode == 200) {
      imageCache.clear();
      imageCache.clearLiveImages();
      return true;
    }
    return false;
  }

  @override
  Future<bool> updateProfil(Profile profile) async {
    if (profile.idUser != null) {
      Map<String, String> json = (profile.toJson()
        ..removeWhere((key, value) => value == null || value is! String));

      String url = BASEURL + "user/${profile.idUser}/profile/edit";

      var response = await client.post(url, body: json);
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return !json['error'];
      }
    }
    return false;
  }

  @override
  Future<Profile> getProfile(int idUser) async {
    Profile result = Profile();
    String url = BASEURL + "user/$idUser/profile";
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      result = Profile.fromJson(json);
    }
    return result;
  }

  @override
  Future<List<Kategori>> getKategoriList() async {
    List<Kategori> results = [];
    String url = BASEURL + KATEGORIPATH;
    var response = await client.get(url);
    if (response.statusCode == 200) {
      results = Kategori().listFromJson(response.body);
    }
    return results;
  }
}
