import 'package:flutter/material.dart';
import 'package:kabarnagari/constants.dart';
import 'package:kabarnagari/models/news.dart';
import 'package:kabarnagari/provider/news_provider.dart';
import 'package:kabarnagari/screens/detail_page.dart';
import 'package:kabarnagari/service/sharepref_service.dart';
import 'package:provider/provider.dart';

class ListNews extends StatelessWidget {
  ListNews(this.news);
  final List<News> news;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: (news.length < 1)
          ? Center(child: Text('maaf anda tidak mempunyai daftar berita'))
          : ListView.builder(
              itemCount: news.length,
              itemBuilder: (context, index) => GestureDetector(
                    onTap: () async {
                      int idUser =
                          (await SPrefService().getLoginDetails())['idUser'];
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => DetailPage(
                              news[index],
                              news[index].title + news[index].idBerita,
                              idUser))).then((value) => Provider.of<NewsProvider>(context,listen: false).loadAllData());
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 5),
                      padding: EdgeInsets.all(8),
                      height: 100,
                      child: Row(children: [
                        Container(
                            width: size.width * 0.38,
                            child: Stack(
                              children: [
                                Hero(
                                  tag: news[index].title + news[index].idBerita,
                                  child: Image.network(
                                    news[index].urlImage,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 7),
                                    height: 20,
                                    color: Colors.blue.withOpacity(0.9),
                                    child: Text(
                                      news[index].namaKategori,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color: bgWhite),
                                    ),
                                  ),
                                )
                              ],
                            )),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Container(
                            child: Column(children: [
                              Text(
                                news[index].title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Text(
                                news[index].kontenBerita,
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 11),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              )
                            ]),
                          ),
                        ),
                      ]),
                    ),
                  )),
    );
  }
}
