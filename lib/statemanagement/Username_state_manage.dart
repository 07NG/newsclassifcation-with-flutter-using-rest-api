import 'package:flutter/material.dart';
import 'package:news_app/api/news_prediction_api.dart';

class PredictionState with ChangeNotifier {
  String? predictedCategory;

  Future<void> predictCategory(String title, String news) async {
    try {
      var predictedCategory =
          await PredictionApi().predictNewsCategory(title, news);
      predictedCategory = predictedCategory;
    } catch (e) {
      throw Exception('Failed to predict news category: $e');
    }
  }
}
