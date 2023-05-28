import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProcessingPage extends StatelessWidget {
  final http.Response? response;

  ProcessingPage({required this.response});

  @override
  Widget build(BuildContext context) {
    // Use the response data as needed in this page
    return Scaffold(
      appBar: AppBar(title: const Text('Next Page')),
      body: Center(
        child: Text('Response: ${response?.body ?? "No response"}'),
      ),
    );
  }
}
