import 'package:flutter/material.dart';
import 'package:kabarnagari/components/list_news.dart';
import 'package:kabarnagari/provider/auth_provider.dart';
import 'package:kabarnagari/provider/news_provider.dart';
import 'package:provider/provider.dart';

class MyNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
              padding: EdgeInsets.all(5),
              child: Consumer2<NewsProvider, AuthProvider>(
                builder: (ctx, newsProv, authProv, _) =>
                    (newsProv.news != null || newsProv.news.length != 0)
                        ? Container(
                            child: ListNews(newsProv.news
                                .where((value) =>
                                    int.tryParse(value.idUser) == authProv.uid)
                                .toList()))
                        : Center(
                            child: CircularProgressIndicator(),
                          ),
              )),
        ),
      ],
    );
  }
}
