import 'package:flutter/material.dart';
import 'package:lg_flutter_app/Pages/home.dart';
import 'package:lg_flutter_app/Pages/con_setting.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LG Controller',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}