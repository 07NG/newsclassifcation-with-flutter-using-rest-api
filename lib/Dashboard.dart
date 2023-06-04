import 'package:flutter/material.dart';
import 'package:news_app/Responsive/desktop_dashboard.dart';
import 'package:news_app/Responsive/mobile_dashboard.dart';
import 'package:news_app/Responsive/responsive_layout.dart';
import 'package:news_app/api/get_category_api.dart';

import 'FirebaseCrud/Add.dart';

class DashboardScreen extends StatelessWidget {
  final CategoryApi categoryApi = CategoryApi();
  final ReadNews readNews = ReadNews();

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileScaffold: mobiledashboardScaffold(),
        desktopScaffold: desktopdashboardScaffold());
  }
}
