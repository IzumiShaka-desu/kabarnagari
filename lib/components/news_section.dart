import 'package:flutter/material.dart';
import 'package:kabarnagari/components/list_news.dart';
import 'package:kabarnagari/models/news.dart';
import 'package:kabarnagari/models/kategori.dart';

class NewsSection extends StatefulWidget {
  NewsSection(this.news, this.katergoriList);
  final List<Kategori> katergoriList;
  final List<News> news;
  @override
  _NewsSectionState createState() => _NewsSectionState();
}

class _NewsSectionState extends State<NewsSection>
    with TickerProviderStateMixin {
  int selectedIndex = 0;
  List<Kategori> kategori;
  TabController _tabController;
  @override
  void initState() {
    initVar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        TabBar(
          isScrollable: true,
          labelColor: Colors.black87,
          controller: _tabController,
          tabs: kategori.map((e) => Tab(text: e.namaKategori)).toList(),
        ),
        Expanded(
          child: TabBarView(
              controller: _tabController,
              children: kategori
                  .map((e) => (e.namaKategori == 'all')
                      ? ListNews(widget.news)
                      : ListNews(widget.news
                          .where((element) =>
                              element.namaKategori == e.namaKategori)
                          .toList()))
                  .toList()),
        )
      ]),
    );
  }

  List<News> newsByCategory(Kategori e) {
    return widget.news
        .takeWhile((value) => value.namaKategori == e.namaKategori)
        .toList();
  }

  void initVar() {
    kategori = [Kategori(idKategori: 0.toString(), namaKategori: 'all')];
    kategori.addAll(widget.katergoriList);
    _tabController = TabController(length: kategori.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        selectedIndex = _tabController.index;
      });
    });
  }
}
