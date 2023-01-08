/*
import 'package:flutter/material.dart';
import 'package:projet/home_page.dart';
import 'package:projet/login.dart';

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
*/

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

import 'package:flutter/material.dart';

import 'screens/sign_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Le Hangar App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        brightness: Brightness.dark,
      ),
      home: const SignInScreen(),
    );
  }
}
