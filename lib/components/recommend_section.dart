import 'package:flutter/material.dart';
import 'package:kabarnagari/models/news.dart';
import 'package:kabarnagari/provider/news_provider.dart';
import 'package:kabarnagari/screens/detail_page.dart';
import 'package:kabarnagari/service/sharepref_service.dart';
import 'package:provider/provider.dart';

class RecommendSection extends StatefulWidget {
  RecommendSection(this.items);
  final List<News> items;
  @override
  _RecommendSectionState createState() => _RecommendSectionState();
}

class _RecommendSectionState extends State<RecommendSection> {
  ScrollController _controller = ScrollController();
  double offset = 0.0;
  @override
  void initState() {
    _controller.addListener(() {
      setState(() {
        offset = _controller.offset;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (widget.items == null || widget.items.length < 1)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: widget.items.length,
              controller: _controller,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) => GestureDetector(
                    onTap: () async {
                      News news = widget.items[index];
                      int idUser =
                          (await SPrefService().getLoginDetails())['idUser'];
                      Navigator.of(context)
                          .push(MaterialPageRoute(
                              builder: (ctx) => DetailPage(news,
                                  news.title + news.idBerita + "rec", idUser)))
                          .then((value) =>
                              Provider.of<NewsProvider>(context, listen: false)
                                  .loadAllData());
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      width: 200,
                      child: Card(
                          child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(children: [
                          Expanded(
                              child: Hero(
                                  tag: widget.items[index].title +
                                      widget.items[index].idBerita +
                                      "rec",
                                  child: Image.network(
                                      widget.items[index].urlImage))),
                          Row(
                            children: [
                              Expanded(
                                  child: Center(
                                      child: Text(
                                widget.items[index].title,
                                style: TextStyle(fontSize: 13),
                                overflow: TextOverflow.ellipsis,
                              )))
                            ],
                          )
                        ]),
                      )),
                    ),
                  )),
    );
  }
}
