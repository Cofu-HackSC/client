import 'package:app/components/button.dart';
import 'package:app/components/header.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        Header('Settings'),
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Button('Sign Out', onPressed: () {
                print('no');
              }),
            )
          ]),
        ),
      ],
    );
  }
}
