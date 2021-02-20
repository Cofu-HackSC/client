import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('hi'),
          ),
          SliverFillRemaining(
            child: Center(
              child: TextButton(
                child: Text('Login'),
                onPressed: () => Navigator.pushNamed(context, '/home'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
