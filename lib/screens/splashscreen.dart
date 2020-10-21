import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kabarnagari/screens/onboard.dart';
import 'package:kabarnagari/screens/pagecontainer.dart';
import 'package:kabarnagari/service/sharepref_service.dart';

import '../constants.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  bool isAnimate = false;
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      setState(() {
        isAnimate = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Material(
      type: MaterialType.transparency,
      child: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Positioned.fill(
                child: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(size.width * 0.1),
                      child: Image.asset(
                        'images/icon.png',
                        width: size.height * 0.60,
                      ),
                    ),
                    Text(
                      'Kabar Nagari',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    )
                  ]),
            )),
            AnimatedPositioned(
              left: (isAnimate)
                  ? -((size.height - size.width) / 2)
                  : size.width / 2,
              top: (isAnimate) ? -300 : size.height / 2,
              duration: Duration(milliseconds: 295),
              child: AnimatedContainer(
                height: size.height + 600,
                width: size.height + 600,
                onEnd: () => goToNext(),
                decoration:
                    BoxDecoration(color: bgGrey, shape: BoxShape.circle),
                transform: Matrix4.identity()
                  ..scale((isAnimate) ? 1.0 : 0.0005),
                duration: Duration(milliseconds: 300),
              ),
            )
          ],
        ),
      ),
    );
  }

  goToNext() async {
    Widget target;
    SPrefService sf = SPrefService();
    bool isSeen = await sf.isSeen();
    if (isSeen ?? false) {
      target = PageContainer();
    } else {
      target = OnBoard();
    }
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (c) => target));
  }
}
