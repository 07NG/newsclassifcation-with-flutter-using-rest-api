import 'package:cloud_firestore/cloud_firestore.dart';

class ReadNews {
  Future<List<Map<String, dynamic>>> readAll() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
    await firestore.collection('category').get();

    List<Map<String, dynamic>> newsList = [];

    if (querySnapshot.docs.length > 0) {
      // Iterate over the documents in the query snapshot
      for (var documentSnapshot in querySnapshot.docs) {
        // Access the document data
        Map<String, dynamic> data = documentSnapshot.data();

        // Access specific fields
        String title = data['title'];
        String description = data['description'];

        // Create a map with the title and description
        Map<String, dynamic> newsData = {
          'title': title,
          'description': description,
        };

        // Add the map to the news list
        newsList.add(newsData);
        print(newsList[0]);
      }
    }

    return newsList;
  }

  Future<List<Map<String, dynamic>>> readnewscategory(String cat) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
    await firestore.collection('category').where('Category',isEqualTo:'$cat').get();

    List<Map<String, dynamic>> newsList = [];

    if (querySnapshot.docs.length > 0) {
      // Iterate over the documents in the query snapshot
      for (var documentSnapshot in querySnapshot.docs) {
        // Access the document data
        Map<String, dynamic> data = documentSnapshot.data();

        // Access specific fields
        String title = data['title'];
        String description = data['description'];

        // Create a map with the title and description and category
        Map<String, dynamic> newsData = {
          'title': title,
          'description': description,
          'Category': cat,
        };

        // Add the map to the news list
        newsList.add(newsData);
        print(newsList[0]);
      }
    }

    return newsList;
  }
}
