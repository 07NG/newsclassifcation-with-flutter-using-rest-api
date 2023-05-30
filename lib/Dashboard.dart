
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project1/Drawer.dart';
import 'package:project1/api/get_category_api.dart';
import 'package:project1/models/Category.dart';
import 'FirebaseCrud/Add.dart';


class DashboardScreen extends StatelessWidget {
  final CategoryApi categoryApi = CategoryApi();
  final ReadNews readNews = ReadNews();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TopBarFb4(
          title: 'Ram',
          upperTitle: 'Ram',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'All News',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Expanded(
            child: FutureBuilder<List<dynamic>>(
              future: Future.wait([
                categoryApi.fetchNews('business'),
                readNews.readAllNews(),
              ]),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Show a loading indicator while data is being fetched
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  // Handle the error case or null data
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  // Combine data from both sources
                  List<dynamic> dataList = snapshot.data!;
                  List<Category> newsData = [];

                  for (var data in dataList) {
                    if (data is List<Category>) {
                      newsData.addAll(data);
                    }
                  }
                  // Sort the newsData list by upload timestamp
                  // newsData.sort((a, b) => b.uploadTimestamp.compareTo(a.uploadTimestamp));

                  return ListView.builder(
                    itemCount: newsData.length,
                    itemBuilder: (context, index) {
                      Category article = newsData[index];
                      return Card(
                        margin: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Title:',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(article.title),
                            SizedBox(
                              height: 4.0,
                            ),
                            Text(
                              'Description:',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(article.description),
                            SizedBox(height: 8.0),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Column(
              children: [
                ListTile(
                  title: Text('Politics'),
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
