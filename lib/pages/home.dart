import 'package:app/models/session.dart';
import 'package:app/global/app_theme.dart';
import 'package:app/pages/cook_profile.dart';
import 'package:app/pages/post_food.dart';
import 'package:flutter/cupertino.dart';
import 'package:app/pages/settings.dart';
import 'package:flutter/material.dart';

import 'feed/feed.dart';
import 'feed/item_info.dart';
import 'feed/order.dart';
import 'orders/orders.dart';

class HomePage extends StatefulWidget {
  final Session session;

  const HomePage({@required this.session});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          activeColor: AppTheme.primary,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
        tabBuilder: (c, i) {
          switch (i) {
            case 0:
              return FeedPage();
            case 1:
              return OrdersPage();
            case 2:
              return CookProfilePage(me, showBack: false);
            default:
              return SettingsPage();
          }
        },
      ),
    );
  }
}
