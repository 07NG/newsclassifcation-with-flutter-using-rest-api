import 'package:flutter/material.dart';
import 'package:news_app/FirebaseCrud/Create.dart';
import 'package:news_app/api/news_prediction_api.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({Key? key}) : super(key: key);

  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final TextEditingController _newsTextController = TextEditingController();
  final TextEditingController _titleTextController = TextEditingController();
  String _predictedCategory = '';
  Create uploadnews = Create();
  Future<void> _predictCategory() async {
    final newsText = _newsTextController.text;
    final titleText = _titleTextController.text;
    try {
      final predictedCategory =
          await PredictionApi().predictNewsCategory(newsText, titleText);
      setState(() {
        _predictedCategory = predictedCategory!;
      });
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Prediction Error'),
            content: const Text('Failed to predict news category.'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Category Prediction'),
        backgroundColor: Colors.grey[400],
      ),
      body: Container(
        color: Colors.grey[300],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'Upload the News Here',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextField(
                  maxLength: 100,
                  controller: _titleTextController,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                  ),
                ),
                TextField(
                  maxLength: 1000,
                  maxLines: 10,
                  controller: _newsTextController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    await _predictCategory();
                    uploadnews.uploadNews(
                        _titleTextController.text,
                        _newsTextController.text,
                        _predictedCategory.toLowerCase());
                  },
                  child: const Text('Predict Category'),
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Predicted Category: $_predictedCategory',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
