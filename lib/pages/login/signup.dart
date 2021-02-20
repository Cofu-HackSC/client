import 'package:app/components/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../../components/themed_text.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController usernameController = new TextEditingController();
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController bioController = new TextEditingController();
  final TextEditingController addressController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  String get username => usernameController.text;
  String get name => nameController.text;
  String get bio => bioController.text;
  String get address => addressController.text;
  String get password => passwordController.text;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: ThemedText(
                  'Sign Up',
                  type: Type.h1,
                ),
              ),
            ),
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
          ],
        ),
      ),
      borderRadius: BorderRadius.circular(40),
    );
  }
}
