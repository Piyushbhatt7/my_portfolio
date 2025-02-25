import 'package:flutter/material.dart';
import 'package:portfolio/pages/home_page.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Piyush Bhatt',
      home: const HomePage(),
    );
  }
}

