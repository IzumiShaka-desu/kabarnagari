import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:kabarnagari/screens/pagecontainer.dart';
import 'package:kabarnagari/service/sharepref_service.dart';

import '../constants.dart';

class OnBoard extends StatefulWidget {
  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  final List<String> images = [
    'images/newsonhand.png',
    'images/findnews.png',
    'images/hotnews.png',
  ];

  final List<String> desc = [
    'berita sekarang di tanganmu',
    'temukan berita',
    'jangan lewatkan berita terbaru'
  ];
  double position = 0;
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    _controller.addListener(() {
      setState(() {
        position = _controller.page;
      });
    });
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 5),
        child: Column(
          children: [
            Container(
                height: 30,
                child: DotsIndicator(
                    position: position, dotsCount: images.length)),
            Expanded(
                child: Container(
                    child: PageView.builder(
                        controller: _controller,
                        itemCount: images.length,
                        itemBuilder: (ctx, index) => Container(
                                child: Column(
                              children: [
                                Expanded(
                                  child: Image.asset(
                                    images[index],
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(bottom: 30),
                                  height: 75,
                                  child: Center(
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [Text(desc[index])]),
                                  ),
                                )
                              ],
                            ))))),
            Container(
              height: 75,
              width: double.infinity,
              child: Column(
                children: [
                  Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                          color: Colors.blue,
                          onPressed: () async {
                            await SPrefService().setSeen();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => PageContainer()));
                          },
                          child: Text(
                            'MULAI',
                            style: TextStyle(
                                color: bgWhite, fontWeight: FontWeight.bold),
                          )),
                    ],
                  )),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
