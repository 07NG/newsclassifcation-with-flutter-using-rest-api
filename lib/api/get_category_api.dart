import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/Category.dart';

class CategoryApi {
  Future<List<Category>> fetchNews(String category) async {
    String apiKey = '544624999aa94a889032731cb9f173c0';
    String url =
        'https://newsapi.org/v2/top-headlines?category=$category&country=us&apiKey=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      List<Category> newsList = [];

      if (jsonData != null && jsonData['articles'] != null) {
        final articles = jsonData['articles'];

        for (var article in articles) {
          String title = article['title'] ?? '';
          String description = article['description'] ?? '';
          String imageurl = article['urlToImage'] ?? '';

          Map<String, dynamic> articleData = {
            'title': title,
            'description': description,
            'image': imageurl,
          };
          newsList.add(Category.fromJson(articleData));
        }
      }

      return newsList;
    } else {
      throw Exception('Failed to fetch news');
    }
  }
}
