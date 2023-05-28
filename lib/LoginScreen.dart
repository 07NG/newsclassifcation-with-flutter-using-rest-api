import 'package:flutter/material.dart';
import 'package:project1/api/auth_api.dart';
import 'package:project1/navbar.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController();
    TextEditingController password = TextEditingController();
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
              controller: username,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: password,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () async {
                try {
                  if (await AuthApi.login(username.text, password.text) ==
                      true) {
                    context.pushNamed('dashboard');
                  } else {
                    context.pushNamed('error');
                  }
                } catch (e) {
                  print(e);
                }
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
