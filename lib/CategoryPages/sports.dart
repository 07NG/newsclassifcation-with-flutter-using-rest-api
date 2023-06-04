import 'package:flutter/material.dart';
import 'package:news_app/api/get_category_api.dart';
import 'package:news_app/models/Category.dart';

import '../FirebaseCrud/Add.dart';

class SportsScreen extends StatelessWidget {
  final CategoryApi categoryApi = CategoryApi();
  final ReadNews readNews = ReadNews();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sports'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Sports News',
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
                categoryApi.fetchNews('sports'),
                readNews.readCategoryNews('sports'),
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
                    child: Text(snapshot.stackTrace.toString()),
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
