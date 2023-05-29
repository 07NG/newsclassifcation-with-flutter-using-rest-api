import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Invalid Username or Password',
          style: TextStyle(fontSize: 25.0,),
        ),
      ),
    );
  }
}
