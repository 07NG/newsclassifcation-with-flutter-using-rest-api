// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Upload')),
      body: Column(children: [
        SizedBox(height: 20.0),
        TextField(
          decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            contentPadding: EdgeInsets.all(8.0),
            labelText: 'Title',
            focusColor: Colors.blue,
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
        TextField(
          decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            contentPadding: EdgeInsets.all(8.0),
            labelText: 'Description',
            focusColor: Colors.blue,
          ),
        ),
      ]),
    );
  }
}
