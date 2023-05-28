import 'dart:convert';

import 'package:http/http.dart' as http;

class CategoryApi {
  // Future<Category> getCategoryData(String category) async {
  //   final response =
  //       await http.get(Uri.parse('http://10.0.2.2:5000/$category'));

  //   if (response.statusCode == 200) {
  //     return Category.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to Load');
  //   }
  // }
  Future<List<Map<String, dynamic>>> fetchNews(String category) async {
    String apiKey = '544624999aa94a889032731cb9f173c0';
    String url =
        'https://newsapi.org/v2/top-headlines?category=$category&country=us&apiKey=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      List<Map<String, dynamic>> newsList = [];

      if (jsonData['articles'] != null) {
        final articles = jsonData['articles'];

        for (var article in articles) {
          String title = article['title'] ?? '';
          String description = article['description'] ?? '';

          Map<String, dynamic> articleData = {
            'title': title,
            'description': description,
          };

          newsList.add(articleData);
        }
      }

      return newsList;
    } else {
      throw Exception('Failed to fetch news');
    }
  }
}
