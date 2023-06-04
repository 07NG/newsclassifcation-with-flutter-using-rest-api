import 'package:flutter/material.dart';
import 'package:news_app/Responsive/desktophome.dart';
import 'package:news_app/Responsive/mobilehome.dart';
import 'package:news_app/Responsive/responsive_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileScaffold: mobilehomeScaffold(),
        desktopScaffold: desktophomeScaffold());
  }
}
