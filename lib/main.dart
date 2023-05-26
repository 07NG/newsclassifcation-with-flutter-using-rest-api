import 'package:flutter/material.dart';
import 'package:project1/HomeScreen.dart';
import 'package:project1/LoginScreen.dart';
import 'package:project1/signup.dart';
import 'package:project1/singup.dart';

void main() => runApp(const myApp());

// ignore: camel_case_types
class myApp extends StatefulWidget {
  const myApp({super.key});

  @override
  State<myApp> createState() => _myAppState();
}

// ignore: camel_case_types
class _myAppState extends State<myApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SignupScreen(),
    );
  }
}
