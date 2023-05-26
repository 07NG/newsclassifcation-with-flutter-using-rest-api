import 'package:flutter/material.dart';
import 'package:project1/navbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HomeItem(
              image: 'images/new.png',
              text: 'New User',
            ),
            HomeItem(
              image: 'images/register.png',
              text: 'Register User',
            ),
            HomeItem(
              image: 'images/guest.png',
              text: 'Guest User',
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBarFb2(),
    );
  }
}

class HomeItem extends StatelessWidget {
  final String image;
  final String text;

  const HomeItem({
    super.key,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Image.asset(
            image,
            width: 150,
            height: 150,
          ),
          const SizedBox(height: 16.0),
          Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
