import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kabarnagari/screens/splashscreen.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
  };
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Splashscreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
