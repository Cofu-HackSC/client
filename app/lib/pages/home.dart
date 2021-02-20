import 'package:app/components/button.dart';
import 'package:app/components/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:app/pages/settings.dart';
import 'package:flutter/material.dart';

import 'feed.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _pages = <Widget>[
    FeedPage(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',
            ),
          ],
        ),
        tabBuilder: (c, i) {
          switch (i) {
            case 0:
              return CustomScrollView(
                slivers: [
                  Header('Home Page'),
                  SliverFillRemaining(
                    child: Center(
                      child: Button(
                        'Log Out',
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                ],
              );
            case 1:
              return Container();
            default:
              return Container();
          }
        },
      ),
    );
  }
}
