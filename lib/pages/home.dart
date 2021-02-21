import 'package:app/models/cook_profile.dart';
import 'package:app/models/session.dart';
import 'package:app/global/app_theme.dart';
import 'package:app/pages/cook_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:app/pages/settings.dart';
import 'package:flutter/material.dart';

import 'feed/feed.dart';
import 'orders/orders.dart';

class HomePage extends StatefulWidget {
  final Session session;

  const HomePage({@required this.session});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    print("ITINST STATE");
  }

  @override
  Widget build(BuildContext context) {
    print('BUILDDD');
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
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
        tabBuilder: (c, i) {
          print(i);

          try {
            switch (i) {
              case 0:
                return FeedPage();
              case 1:
                return OrdersPage();
              case 2:
                return FutureBuilder<CookProfile>(
                  builder: (c, s) {
                    if (s.connectionState != ConnectionState.done ||
                        !s.hasData ||
                        s.data == null) {
                      return Container();
                    } else {
                      return CookProfilePage(
                        s.data,
                        showBack: false,
                        isMe: true,
                      );
                    }
                  },
                  future: CookProfile.load(widget.session),
                );

              default:
                return SettingsPage();
            }
          } catch (e) {
            print(e);
            return Container();
          }
        },
      ),
    );
  }
}
