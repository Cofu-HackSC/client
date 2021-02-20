import 'dart:convert';

import 'package:app/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:app/components/button.dart';
import 'package:app/global/app_theme.dart';
import 'package:http/http.dart' as http;

import '../../components/themed_text.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController usernameController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController bioController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  String get username => usernameController.text;
  String get name => nameController.text;
  String get bio => bioController.text;
  String get address => addressController.text;
  String get password => passwordController.text;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Scaffold(
        body: Stack(
          children: [
            ListView(
              padding: EdgeInsets.only(top: 100),
              children: [
                CustomTextField(
                  controller: usernameController,
                  labelText: 'Username',
                ),
                CustomTextField(
                  controller: nameController,
                  labelText: 'Name',
                ),
                CustomTextField(
                  controller: bioController,
                  labelText: 'Bio',
                ),
                CustomTextField(
                  controller: addressController,
                  labelText: 'Address',
                ),
                CustomTextField(
                  controller: passwordController,
                  labelText: 'Password',
                ),
                SizedBox(height: 22),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Button(
                    'Sign Up',
                    onPressed: () async {
                      var response = await createAlbum();
                      print(response.body);
                    },
                  ),
                )
              ],
            ),
            Container(
              height: 89,
              color: AppTheme.buttonText,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ThemedText(
                      'Sign Up',
                      type: Type.h1,
                    ),
                  ),
                  Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40), topRight: Radius.circular(40)),
    );
  }

  Future<http.Response> createAlbum() {
    return http.post(
      'https://cofu-305406.wl.r.appspot.com/auth/signup',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'name': name,
        'bio': bio,
        'address': address,
        'password': password,
      }),
    );
  }
}
