import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';

class UploadNews {
  void uploadnews(String title, String desc, String cat) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference newscollection = firestore.collection('category');

    newscollection.add({
      'title': title,
      'description': desc,
      'Category': cat,
    }
    );
  }
}