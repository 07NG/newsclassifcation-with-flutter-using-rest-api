import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Category Prediction',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _newsTextController = TextEditingController();
  final TextEditingController _titleTextController = TextEditingController();
  String _predictedCategory = '';

  Future<void> _predictCategory() async {
    final newsText = _newsTextController.text;
    final titleText = _titleTextController.text;
    try {
      final predictedCategory = await predictNewsCategory(newsText, titleText);
      setState(() {
        _predictedCategory = predictedCategory;
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
              controller: _titleTextController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              controller: _newsTextController,
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _predictCategory,
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
    );
  }
}

Future<String> predictNewsCategory(String newsText, String titleText) async {
  final apiUrl = 'http://10.0.2.2:5000/processing/$titleText/$newsText/predict';

  final response = await http.post(
    Uri.parse(apiUrl),
    body: {'title': titleText, 'news_text': newsText},
  );

  if (response.statusCode == 200) {
    final responseBody = json.decode(response.body);
    final predictedCategory = responseBody['context'];
    return predictedCategory;
  } else if (response.statusCode == 302) {
    final redirectUrl = response.headers['location'];
    if (redirectUrl != null) {
      final finalRedirectUrl = await getFinalRedirectUrl(redirectUrl);
      if (finalRedirectUrl != null) {
        final finalRedirectResponse =
            await http.get(Uri.parse(finalRedirectUrl));
        if (finalRedirectResponse.statusCode == 200) {
          final finalRedirectResponseBody =
              json.decode(finalRedirectResponse.body);
          final predictedCategory = finalRedirectResponseBody['context'];
          return predictedCategory;
        }
      }
    }
    throw Exception('Failed to predict news category');
  } else {
    throw Exception('Failed to predict news category');
  }
}

Future<String?> getFinalRedirectUrl(String url) async {
  final response = await http.head(Uri.parse(url));
  if (response.statusCode == 302) {
    final redirectUrl = response.headers['location'];
    if (redirectUrl != null) {
      return redirectUrl;
    }
  }
  return null;
}
