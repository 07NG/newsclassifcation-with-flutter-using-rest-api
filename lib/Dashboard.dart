// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project1/Drawer.dart';

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
                ),
                SizedBox(
                  height: 40.0,
                  child: ListTile(
                    title: Text('DashboardScreen'),
                    leading: Icon(Icons.dashboard_customize),
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
