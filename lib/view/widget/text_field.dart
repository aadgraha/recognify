import 'package:flutter/material.dart';
import 'package:recognify/util/color.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.label,
    this.minLines,
    this.controller,
  });
  final String? label;
  final int? minLines;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(color: CustomColor.onDialog()),
      minLines: minLines,
      maxLines: null,
      decoration: InputDecoration(
        label: label != null ? Text(label!) : null,
        labelStyle: TextStyle(color: CustomColor.label()),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: CustomColor.onDialog()),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: CustomColor.onDialog()),
        ),
      ),
    );
  }
}
