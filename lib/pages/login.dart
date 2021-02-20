import 'package:app/components/button.dart';
import 'package:app/components/header.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          Header('Login'),
          SliverFillRemaining(
            child: Center(
              child: Button(
                'Login',
                onPressed: () => Navigator.pushNamed(context, '/home'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
