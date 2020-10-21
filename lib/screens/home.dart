import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:kabarnagari/provider/news_provider.dart';
import 'package:kabarnagari/screens/add_edit_page.dart';
import 'package:kabarnagari/screens/feed.dart';
import 'package:kabarnagari/screens/my_news.dart';
import 'package:kabarnagari/screens/profile.dart';
import 'package:kabarnagari/screens/search.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  TabController _tController;

  List<String> titles = ['Feed', 'Kabarku', 'Search', 'profile'];
  final List<Widget> tabs = [Feed(), MyNews(), Search(), ProfileTab()];

  @override
  void initState() {
    _tController = TabController(length: tabs.length, vsync: this);
    _tController.addListener(() {
      setState(() {
        _selectedIndex = _tController.index;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(title: Text(titles[_selectedIndex])),
      body: SafeArea(
          child: TabBarView(
        children: tabs,
        controller: _tController,
      )),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                gap: 8,
                activeColor: Colors.white,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                duration: Duration(milliseconds: 800),
                tabBackgroundColor: Colors.grey[800],
                tabs: [
                  GButton(
                    icon: LineIcons.home,
                    text: 'Feed',
                  ),
                  GButton(
                    icon: LineIcons.newspaper_o,
                    text: 'Kabarku',
                  ),
                  GButton(
                    icon: LineIcons.search,
                    text: 'Search',
                  ),
                  GButton(
                    icon: LineIcons.user,
                    text: 'Profile',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                    _tController.animateTo(index);
                  });
                }),
          ),
        ),
      ),
      floatingActionButton: Transform.scale(
          scale: (_selectedIndex == 1) ? 1 : 0,
          child: Consumer<NewsProvider>(
            builder: (ctx, provider, _) => FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () async {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => AddEditNews())).then((value) => Provider.of<NewsProvider>(context,listen: false).loadAllData());
                
              },
            ),
          )),
    );
  }
}
