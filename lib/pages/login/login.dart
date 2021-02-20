import 'dart:convert';
import 'dart:ui';

import 'package:app/components/button.dart';
import 'package:app/components/custom_text_field.dart';
import 'package:app/components/themed_text.dart';
import 'package:app/pages/login/signup.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:http/http.dart' as http;

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
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ThemedText(
                    'Welcome Back',
                    type: Type.h1,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Column(
                children: [
                  CustomTextField(
                      controller: usernameController, labelText: 'Username'),
                  CustomTextField(
                      controller: passwordController, labelText: 'Password'),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Button(
                      'Sign In',
                      onPressed: () async {
                        var returnThing = await createAlbum();
                        print(returnThing);
                      },
                    ),
                  ),
                  SizedBox(height: 8),
                  TextButton(
                    child: ThemedText(
                      'Sign Up',
                      type: Type.subtitle,
                    ),
                    onPressed: () => panelController.open(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<http.Response> createAlbum() {
    return http.post(
      'https://cofu-305406.wl.r.appspot.com/auth/signin',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{'username': username, 'password': password}),
    );
  }
}
