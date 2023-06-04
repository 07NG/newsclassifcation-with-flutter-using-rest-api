import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileScaffold;
  final Widget desktopScaffold;

  ResponsiveLayout(
      {required this.mobileScaffold, required this.desktopScaffold});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 1100) {
          return mobileScaffold;
        } else {
          return desktopScaffold;
        }
      },
    );
  }
}
