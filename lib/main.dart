import 'package:flutter/material.dart';
import 'input_page.dart';
void main() {
  runApp(const BmiApp());
}

class BmiApp extends StatelessWidget {
  const BmiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xff111639),
        scaffoldBackgroundColor: const Color(0xff0c1135),
      ),
      home: const InputPage(),

    );
  }
}