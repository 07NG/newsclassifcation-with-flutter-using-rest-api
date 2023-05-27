// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project1/Drawer.dart';
import 'package:project1/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project1/routes/app_route_config.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TopBarFb4(
          title: 'Hello',
          upperTitle: 'Ram',
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Column(
              children: [
                ListTile(
                  title: Text(
                    'Politics',
                  ),
                  leading: Icon(Icons.policy_sharp),
                ),
                ListTile(
                  title: Text('Technology'),
                  leading: Icon(Icons.laptop),
                ),
                ListTile(
                  title: Text('Sports'),
                  leading: Icon(Icons.sports_football),
                ),
                ListTile(
                  title: Text('Business'),
                  leading: Icon(Icons.business),
                ),
                ListTile(
                  title: Text('Politics'),
                  leading: Icon(Icons.business),
                  onTap: () {
                    // final String location = context.namedLocation('login');
                    context.goNamed('login');
                    // print(location);
                  },
                ),
                SizedBox(
                  height: 40.0,
                  child: ListTile(
                    title: Text('Upload'),
                    leading: Icon(Icons.dashboard_customize),
                    onTap: () => context.pushNamed('upload'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
