import 'package:flutter/material.dart';
import 'package:kabarnagari/components/header_cust.dart';
import 'package:kabarnagari/components/sliver_header.dart';
import 'package:kabarnagari/constants.dart';
import 'package:kabarnagari/models/news.dart';
import 'package:kabarnagari/screens/add_edit_page.dart';
import 'package:line_icons/line_icons.dart';

class DetailPage extends StatelessWidget {
  DetailPage(this.news, this.tags, this.idUser);
  final String tags;
  final News news;
  final int idUser;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            snap: true,
            stretch: true,
            floating: true,
            pinned: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Container(
                child: Padding(
                  padding: EdgeInsets.only(left: size.width / 8.5, right: 10),
                  child: Text(
                    news.title,
                    style: TextStyle(fontSize: 17, color: Colors.black87),
                  ),
                ),
              ),
              background: Stack(
                children: [
                  Positioned.fill(
                      child: Hero(
                    tag: tags,
                    child: Image.network(
                      news.urlImage,
                      fit: BoxFit.cover,
                    ),
                  )),
                  Container(color: Colors.white.withOpacity(0.6))
                ],
              ),
            ),
            leading: IconButton(
              icon: Icon(LineIcons.chevron_circle_left),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          SliverCustHeader(HeaderCust(
              height: 50,
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                color: Colors.grey[350],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('oleh : ${news.namaAuthor ?? ''}',
                        style: TextStyle(color: bgWhite)),
                    Text(news.dateString, style: TextStyle(color: bgWhite))
                  ],
                ),
              )))
        ];
      },
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Container(child: Text(news.kontenBerita)),
              ),
            ],
          ),
        ),
      ),
    ),
    floatingActionButton:Transform.scale(scale: (idUser.toString()==news.idUser)?1:0,child: FloatingActionButton(onPressed: () { 
      Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>AddEditNews(news:news)));
     },child: Icon(LineIcons.edit),),) ,
    );
  }
}
