import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project1/routes/app_route_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(myApp());
}

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
