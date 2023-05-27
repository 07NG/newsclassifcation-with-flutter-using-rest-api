import 'package:flutter/material.dart';
import 'package:project1/navbar.dart';
import 'package:go_router/go_router.dart';
import 'package:project1/routes/app_route_config.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Perform login authentication logic here
              },
              child: const Text('Signin'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBarFb2(),
    );
  }
}
