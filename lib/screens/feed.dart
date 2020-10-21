import 'package:flutter/material.dart';
import 'package:kabarnagari/components/news_section.dart';
import 'package:kabarnagari/components/recommend_section.dart';
import 'package:kabarnagari/provider/news_provider.dart';
import 'package:provider/provider.dart';

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Rekomendasi  ',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      SizedBox(
                        height: 1,
                        width: size.width * 0.32,
                        child: Container(
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  )
                ],
              )),
          Container(
            height: size.height * 0.22,
            padding: EdgeInsets.only(top: 5),
            child: Consumer<NewsProvider>(
                builder: (ctx, newsProvider, _) =>
                    RecommendSection(newsProvider.recommendNews)),
          ),
          Expanded(
            child: Container(
                padding: EdgeInsets.only(top: 5),
                child: Consumer<NewsProvider>(
                  builder: (ctx, newsProvider, _) =>
                      (newsProvider.news == null ||
                              newsProvider.kategoriList == null)
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : NewsSection(
                              newsProvider.news, newsProvider.kategoriList),
                )),
          )
        ],
      ),
    );
  }
}
