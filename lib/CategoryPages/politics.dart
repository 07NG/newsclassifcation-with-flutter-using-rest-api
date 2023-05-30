import 'package:flutter/material.dart';
import 'package:project1/api/get_category_api.dart';
import 'package:project1/models/Category.dart';

import '../FirebaseCrud/Add.dart';

class PoliticsScreen extends StatelessWidget {
  final CategoryApi categoryApi = CategoryApi();
  final ReadNews readNews = ReadNews();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Politics'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Politics News',
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
              future: Future.wait([categoryApi.fetchNews('politics'),
                readNews.readCategoryNews('politics'),]),
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
