import 'package:flutter/material.dart';
import 'package:project1/api/get_category_api.dart';
import 'package:project1/models/Category.dart';

class EntertainmentScreen extends StatelessWidget {
  final CategoryApi categoryApi = CategoryApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entertainment'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Entertainment News',
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
            child: FutureBuilder<List<Category>>(
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
                      return Column(
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
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
