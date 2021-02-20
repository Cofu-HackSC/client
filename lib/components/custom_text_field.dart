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
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: new OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          labelText: labelText,
          fillColor: Colors.grey[300],
          filled: true,
          suffixIcon: trailing,
        ),
      ),
    );
  }
}
