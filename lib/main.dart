import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project1/routes/app_route_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(myApp());
}

class myApp extends StatefulWidget {
   myApp({super.key});

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  final CollectionReference _collectionReference = FirebaseFirestore.instance.collection('category');

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: MyAppRouter().route.routeInformationParser,
      routerDelegate: MyAppRouter().route.routerDelegate,
      routeInformationProvider: MyAppRouter().route.routeInformationProvider,
    );
  }
}
