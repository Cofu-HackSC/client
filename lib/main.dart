import 'package:app/models/session.dart';
import 'package:app/global/app_theme.dart';
import 'package:app/pages/application.dart';
import 'package:app/pages/home.dart';
import 'package:app/pages/login/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Cofu());
}

class Cofu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cofu',
      theme: ThemeData(
        primaryColor: AppTheme.primary,
      ),
      builder: (c, w) => Provider(
        create: (c) => Session(),
        builder: (c, w) => w,
        child: w,
      ),
      initialRoute: '/login',
      routes: {
        '/home': (context) => HomePage(
              session: Provider.of<Session>(context),
            ),
        '/login': (context) => LoginPage(
              session: Provider.of<Session>(context),
            ),
        '/application': (context) => Application(
              session: Provider.of<Session>(context),
            ),
      },
    );
  }
}
