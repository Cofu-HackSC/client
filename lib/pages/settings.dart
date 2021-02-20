import 'package:app/components/header.dart';
import 'package:flutter/material.dart';

import 'register_as_cook.dart';

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
                onTap: () => Navigator.of(context).pushNamed('/login'),
              ),
              ListTile(
                title: Text('Want to sell on Cofu'),
                subtitle: Text(
                  'Apply Here ➡️',
                ),
                onTap: () => Navigator.of(context).pushNamed(
                  '/application',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
