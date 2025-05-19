import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:recognify/view/widget/card.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 180),
            children: [Gap(20), DeveloperCard()],
          ),
        ),
      ),
    );
  }
}
