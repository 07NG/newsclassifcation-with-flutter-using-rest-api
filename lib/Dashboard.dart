import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project1/Drawer.dart';
import 'package:project1/api/get_category_api.dart';
import 'package:project1/models/Category.dart';

class DashboardScreen extends StatelessWidget {
  final CategoryApi categoryApi = CategoryApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TopBarFb4(
          title: 'Ram',
          upperTitle: 'Ram',
        ),
      ),
      body: FutureBuilder<List<Category>>(
        future: categoryApi.fetchNews('technology'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator while data is being fetched
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            // Handle the error case or null data
            return Center(
              child: Text(snapshot.stackTrace.toString()),
            );
          } else {
            // Render the Category data using snapshot.data
            List<Category> newsData = snapshot.data!;

            return ListView.builder(
              itemCount: newsData.length,
              itemBuilder: (context, index) {
                Category article = newsData[index];
                return Column(children: [
                  Text('Title:'),
                  Text(article.title),
                  SizedBox(
                    height: 4.0,
                  ),
                  Text('Description:'),
                  Text(article.description),
                ]);
              },
            );
          }
        },
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
                  onTap: () => context.pushNamed('politics'),
                ),
                ListTile(
                  title: Text('Technology'),
                  leading: Icon(Icons.laptop),
                  onTap: () => context.pushNamed('technology'),
                ),
                ListTile(
                  title: Text('Sports'),
                  leading: Icon(Icons.sports_football),
                  onTap: () => context.pushNamed('sports'),
                ),
                ListTile(
                  title: Text('Business'),
                  leading: Icon(Icons.business),
                  onTap: () => context.pushNamed('business'),
                ),
                ListTile(
                  title: Text('Entertainment'),
                  leading: Icon(Icons.business),
                  onTap: () => context.pushNamed('entertainment'),
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
