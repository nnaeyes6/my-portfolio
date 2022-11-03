// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyPorfolioPage(),
    );
  }
}

class MyPorfolioPage extends StatelessWidget {
  const MyPorfolioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Hello Portfolio'),
      ),
    );
  }
}
