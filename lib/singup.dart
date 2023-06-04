import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/navbar.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _obscureText = true;
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.grey[300],
        padding: const EdgeInsets.all(16),
        // constraints:
        //     BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              Icons.signpost_outlined,
              size: 100,
              color: Colors.grey[600],
            ),
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
              obscureText: _obscureText,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[600],
              ),
              onPressed: () {
                FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: email.text, password: password.text);
              },
              child: const Text('Signup'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBarFb2(),
    );
  }
}
