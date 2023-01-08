import 'package:flutter/material.dart';
import 'package:projetversion1/home_page.dart';
import 'package:projetversion1/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Le Hangar App',
      debugShowCheckedModeBanner: false,
      //home: HomePage(),
      home: login(),
    );
  }
}


/*
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Fluter Demo',
      debugShowCheckedModeBanner: true,
      home: HomePage(),
      );
  }
}
*/