import 'package:flutter/material.dart';
import 'package:news_app/navbar.dart';

class desktophomeScaffold extends StatelessWidget {
  // const desktophomeScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(35),
        child: AppBar(
          backgroundColor: Colors.grey[300],
          elevation: 0.0,
        ),
      ),
      body: Container(
        color: Colors.grey[300],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
      bottomNavigationBar: BottomNavBarFb2(),
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
