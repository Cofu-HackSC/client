import 'package:app/models/session.dart';
import 'package:app/pages/home.dart';
import 'package:app/pages/login/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
      },
    );
  }
}
