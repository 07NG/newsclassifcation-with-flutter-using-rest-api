import 'package:http/http.dart' as http;
import 'dart:convert';

class PredictionApi {
  Future<String?> predictNewsCategory(String newsText, String titleText) async {
    final apiUrl =
        'http://10.0.2.2:5000/processing/$titleText/$newsText/predict';

    final response = await http.post(
      Uri.parse(apiUrl),
      body: {'title': titleText, 'news_text': newsText},
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final predictedCategory = responseBody['category'];
      return predictedCategory;
    } else if (response.statusCode == 302) {
      String? redirectUrl = response.headers['location'];
      print('Redirect URL: $redirectUrl');
      return redirectUrl;
    } else {
      throw new Exception('error');
    }
  }
}
