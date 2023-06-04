import 'package:flutter/material.dart';
import 'package:news_app/Responsive/desktop_login.dart';
import 'package:news_app/Responsive/mobile_login.dart';
import 'package:news_app/Responsive/responsive_layout.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileScaffold: mobileloginScaffold(),
        desktopScaffold: desktoploginScaffold());
  }
}
