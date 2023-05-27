import 'package:flutter/material.dart';
import 'package:project1/routes/app_route_config.dart';
import 'package:project1/Dashboard.dart';
import 'package:project1/HomeScreen.dart';
import 'package:project1/LoginScreen.dart';
import 'package:project1/singup.dart';

void main() => runApp(const myApp());

// ignore: camel_case_types
class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: MyAppRouter().route.routeInformationParser,
      routerDelegate: MyAppRouter().route.routerDelegate,
      routeInformationProvider: MyAppRouter().route.routeInformationProvider,
    );
  }
}
