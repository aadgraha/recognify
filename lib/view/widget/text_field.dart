import 'package:demo_project/util/color.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.label});
  final String? label;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: CustomColor.onDialog()),
      decoration: InputDecoration(
        label: label != null ? Text('Subject') : null,
        labelStyle: TextStyle(color: CustomColor.label()),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.5, color: CustomColor.onDialog()),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: CustomColor.onDialog()),
        ),
      ),
    );
  }
}
