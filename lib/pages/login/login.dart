import 'dart:convert';
import 'dart:ui';

import 'package:app/components/button.dart';
import 'package:app/components/custom_text_field.dart';
import 'package:app/components/themed_text.dart';
import 'package:app/global/app_theme.dart';
import 'package:app/models/session.dart';
import 'package:app/pages/login/signup.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  final Session session;
  LoginPage({@required this.session});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final PanelController panelController = new PanelController();

  String get username => usernameController.text;
  String get password => passwordController.text;

  bool hidePassword;

  @override
  void initState() {
    hidePassword = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      controller: panelController,
      backdropEnabled: true,
      minHeight: 0,
      maxHeight: MediaQuery.of(context).size.height * 0.9,
      borderRadius: BorderRadius.circular(40),
      defaultPanelState: PanelState.CLOSED,
      panel: SignUpPage(
        session: widget.session,
      ),
      body: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                collapsedHeight: 56,
                expandedHeight: MediaQuery.of(context).size.height / 2.5,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  titlePadding: EdgeInsets.only(bottom: 60),
                  title: Image.asset(
                    'assets/CofuLOGObg.png',
                    height: MediaQuery.of(context).size.height / 5,
                  ),
                ),
                backgroundColor: Color(0x00),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    SizedBox(
                      height: 16,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: SizedBox(
                    //     width: double.infinity,
                    //     child: ThemedText(
                    //       'Welcome Back',
                    //       type: Type.h1,
                    //       textAlign: TextAlign.left,
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: ,
                    // ),
                    Column(
                      children: [
                        CustomTextField(
                            controller: usernameController,
                            labelText: 'Username'),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: TextField(
                              obscureText: hidePassword,
                              controller: passwordController,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                border: InputBorder.none,
                                fillColor: Colors.grey[300],
                                filled: true,
                                suffixIcon: TextButton(
                                  style: TextButton.styleFrom(
                                      primary: AppTheme.logoGreen),
                                  child: ThemedText(
                                    hidePassword ? 'Show' : 'Hide',
                                    color: AppTheme.logoGreen,
                                  ),
                                  onPressed: () => setState(
                                      () => hidePassword = !hidePassword),
                                ),
                                labelStyle: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 5,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Button(
                            'Sign In',
                            onPressed: () async {
                              await login(context);
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
            ],
          ),
        ),
      ),
    );
  }

  Future<void> login(BuildContext context) {
    return http
        .post(
      'https://cofu-305406.wl.r.appspot.com/auth/signin',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{'username': username, 'password': password}),
    )
        .then((value) {
      switch (value.statusCode) {
        case 200:
          widget.session.fromSetCookie(value.headers['set-cookie']);
          return Navigator.of(context).pushNamed('/home');
        default:
          print(value.body);
          print(value.statusCode);
      }
    });
  }
}
