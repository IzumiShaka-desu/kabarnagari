
import 'package:flutter/material.dart';
import 'package:kabarnagari/models/kategori.dart';
import 'package:kabarnagari/models/news.dart';
import 'package:kabarnagari/service/network_service.dart';

class NewsProvider extends ChangeNotifier {
  List<News> _news, _recommendNews;
  List<Kategori> _kategoriList;
  NetworkService _networkService = NetworkService();

  List<News> get news => _news;
  List<News> get recommendNews => _recommendNews;
  List<Kategori> get kategoriList => _kategoriList;

  NewsProvider.initWithData() {
    loadAllData();
  }

  loadAllData() async {
    await loadRecommendNews();
    await loadNews();
    await loadKategori();
  }

  Future loadRecommendNews() async {
    try {
      var result = await _networkService.getNews(isRekomended: true);
      _recommendNews = result;
      notifyListeners();
      return recommendNews;
    } catch (e) {
      debugPrint(e.toString());
    }
    notifyListeners();
  }

  loadNews() async {
    try {
      var result = await _networkService.getNews();
      _news = result;
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  loadKategori() async {
    try {
      var result = await _networkService.getKategoriList();
      _kategoriList = result;
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
    notifyListeners();
  }
}