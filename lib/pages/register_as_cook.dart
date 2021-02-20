import 'dart:convert';

import 'package:app/components/custom_text_field.dart';
import 'package:app/components/header.dart';
import 'package:app/components/themed_text.dart';
import 'package:flutter/material.dart';
import 'package:app/components/button.dart';
import 'package:app/global/app_theme.dart';
import 'package:http/http.dart' as http;

class CookSignUpPage extends StatefulWidget {
  @override
  _CookSignUpPageState createState() => _CookSignUpPageState();
}

class _CookSignUpPageState extends State<CookSignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        Header('Register as Cook'),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Button(
                  'Register',
                  onPressed: () async {
                    var response = await createAlbum();
                    print(response.body);
                  },
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }

  Future<http.Response> createAlbum() {
    return http.post(
      'https://cofu-305406.wl.r.appspot.com/auth/SignUp',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{}),
    );
  }
}
