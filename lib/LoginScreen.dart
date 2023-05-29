import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project1/navbar.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});


  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
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
              controller: email,
              decoration: const InputDecoration(labelText: 'Email'),
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
                  final UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: password.text);
                  if (userCredential.user != null) {
                    context.pushNamed('dashboard');
                  } else {
                    context.push('error:'); // Replace 'error' with the route name for your error screen
                  }
                } catch (Error) {
                  print('Error: $Error');
                  context.pushNamed('error'); // Replace 'error' with the route name for your error screen
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
