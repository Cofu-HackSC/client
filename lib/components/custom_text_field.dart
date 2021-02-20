import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final Widget trailing;
  CustomTextField({
    @required this.controller,
    @required this.labelText,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          fillColor: Colors.red,
          focusColor: Colors.green,
          hoverColor: Colors.red,
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
