import 'package:app/components/button.dart';
import 'package:app/components/header.dart';
import 'package:app/components/themed_text.dart';
import 'package:app/pages/login.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        Header('Settings'),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              ListTile(
                  title: Text('Sign Out'),
                  subtitle: Text(
                    'We\'ll miss you🥺',
                  ),
                  onTap: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (c) => LoginPage(),
                        ),
                      )),
            ],
          ),
        ),
      ],
    );
  }
}
