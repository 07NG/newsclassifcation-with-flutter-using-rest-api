import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/navbar.dart';

class desktoploginScaffold extends StatelessWidget {
  // const desktoploginScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.grey[300],
      //   elevation: 0.0,
      // ),
      body: Container(
        // color: Colors.grey[300],
        // padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/login.png'), fit: BoxFit.cover)),
        child: Card(
          color: Colors.transparent,
          shadowColor: Colors.black12,
          elevation: 0.0,
          margin: EdgeInsets.fromLTRB(
              width * 0.5, height * 0.08, width * 0.5, height * 0.12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: email,
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.white),
                    suffixIcon: Icon(Icons.email),
                    suffixIconColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF78909C)),
                    ),
                    contentPadding: EdgeInsets.all(10)),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: password,
                obscureText: true,
                obscuringCharacter: '*',
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white),
                  suffixIcon: Icon(Icons.password),
                  suffixIconColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF78909C)),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      side: BorderSide(
                        color: Colors.black45,
                      )),
                  onPressed: () async {
                    try {
                      final UserCredential userCredential = await FirebaseAuth
                          .instance
                          .signInWithEmailAndPassword(
                              email: email.text, password: password.text);
                      if (userCredential.user != null) {
                        context.pushNamed('dashboard');
                      } else {
                        context.push(
                            'error:'); // Replace 'error' with the route name for your error screen
                      }
                    } catch (Error) {
                      print('Error: $Error');
                      context.pushNamed(
                          'error'); // Replace 'error' with the route name for your error screen
                    }
                  },
                  child: const Text('Signin'),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBarFb2(),
    );
  }
}
