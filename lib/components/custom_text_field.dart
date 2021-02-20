import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final Widget trailing;
  final void Function(String) onSubmit;
  CustomTextField({
    @required this.controller,
    @required this.labelText,
    this.onSubmit,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: TextField(
          controller: controller,
          onSubmitted: onSubmit,
          decoration: InputDecoration(
            labelText: labelText,
            border: InputBorder.none,
            fillColor: Colors.grey[300],
            filled: true,
            suffixIcon: trailing,
            labelStyle: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
