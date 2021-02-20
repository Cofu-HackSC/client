import 'dart:ui';

import 'package:app/components/button.dart';
import 'package:app/components/custom_text_field.dart';
import 'package:app/components/themed_text.dart';
import 'package:app/pages/login/signup.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final PanelController panelController = new PanelController();

  String get username => usernameController.text;
  String get password => passwordController.text;

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      controller: panelController,
      backdropEnabled: true,
      minHeight: 0,
      maxHeight: MediaQuery.of(context).size.height * 0.9,
      borderRadius: BorderRadius.circular(
        40,
      ),
      defaultPanelState: PanelState.CLOSED,
      panel: SignUpPage(),
      body: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/example_img.jpg',
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height - 300,
                ),
                Container(
                  color: Colors.white,
                  height: 300,
                ),
              ],
            ),
            CustomScrollView(
              reverse: true,
              slivers: [
                SliverToBoxAdapter(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    child: Container(
                      color: Colors.white,
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'COFU',
                              style: TextStyle(
                                fontSize: 40,
                              ),
                            ),
                          ),
                          CustomTextField(
                              controller: usernameController,
                              labelText: 'Username'),
                          CustomTextField(
                              controller: passwordController,
                              labelText: 'Password'),
                          SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: Button(
                                'Sign In',
                                onPressed: () {},
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: SelectableText(
                              'Sign Up',
                              onTap: () => panelController.open(),
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
