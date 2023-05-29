import 'package:flutter/material.dart';
import 'package:project1/navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController email = new TextEditingController();

  TextEditingController password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: email,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
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
                onPressed: () {
                  FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: email.text, password: password.text);
                },
                child: const Text('Signup'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBarFb2(),
    );
  }
}
