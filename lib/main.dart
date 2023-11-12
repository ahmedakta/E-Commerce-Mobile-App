import 'package:flutter/material.dart';
import 'package:jiki/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jiki',
      theme: ThemeData(fontFamily: "Lato"),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
