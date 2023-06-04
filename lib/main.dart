import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news_app/routes/app_route_config.dart';
import 'package:news_app/statemanagement/Username_state_manage.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyBePKjwhvPo0fdI_WGJ3YI7W5NDQvXFWCg',
      projectId: 'flutter-firebase-3edbc',
      appId: '1:797738122971:android:35f082b15d61b26e9356fe',
      messagingSenderId: '',
      // Add other necessary options here
    ),
  );
  return runApp(myApp());
}

class myApp extends StatelessWidget {
  myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PredictionState(),
        )
      ],
      child: MaterialApp.router(
        routeInformationParser: MyAppRouter().route.routeInformationParser,
        routerDelegate: MyAppRouter().route.routerDelegate,
        routeInformationProvider: MyAppRouter().route.routeInformationProvider,
      ),
    );
  }
}
