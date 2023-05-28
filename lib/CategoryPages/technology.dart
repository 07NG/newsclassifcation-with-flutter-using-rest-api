import 'package:flutter/material.dart';
import 'package:project1/api/get_category_api.dart';

class TechnologyScreen extends StatelessWidget {
  final CategoryApi categoryApi = CategoryApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Technology'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
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
            List<Map<String, dynamic>> newsData = snapshot.data!;

            return ListView.builder(
              itemCount: newsData.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> article = newsData[index];
                return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Title:'),
                      Text(article['title']),
                      SizedBox(
                        height: 4.0,
                      ),
                      Text('Description:'),
                      Text(article['description']),
                    ]);
              },
            );
          }
        },
      ),
    );
  }
}
