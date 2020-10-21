import 'package:flutter/material.dart';
import 'package:kabarnagari/constants.dart';
import 'package:kabarnagari/provider/auth_provider.dart';
import 'package:kabarnagari/provider/news_provider.dart';
import 'package:kabarnagari/screens/home.dart';
import 'package:kabarnagari/screens/login_register.dart';
import 'package:provider/provider.dart';

class PageContainer extends StatefulWidget {
  @override
  _PageContainerState createState() => _PageContainerState();
}

class _PageContainerState extends State<PageContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: bgWhite,
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider<AuthProvider>(
                create: (context) => AuthProvider.initWithStateLogin()),
            ChangeNotifierProvider<NewsProvider>(
                create: (context) => NewsProvider.initWithData())
          ],
          child: Container(
            child: Consumer<AuthProvider>(
                builder: (ctx, auth, _) => (auth.loginStatus == null)
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container(
                        child: (auth.loginStatus ?? false)
                            ? Home()
                            : LoginRegister())),
          ),
        ));
  }
}
