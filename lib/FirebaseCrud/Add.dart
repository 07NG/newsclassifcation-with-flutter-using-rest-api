import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_app/models/Category.dart';

class ReadNews {
  Future<List<Category>> readAllNews() async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('category');
    QuerySnapshot querySnapshot = await collectionReference.get();

    List<Category> newsData = [];

    querySnapshot.docs.forEach((documentSnapshot) {
      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;

      Category category = Category(
        title: data['title'],
        description: data['description'],
        image: data['image'],
      );
      newsData.add(category);
    });

    return newsData;
  }

  Future<List<Category>> readCategoryNews(String category) async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('category');
    QuerySnapshot querySnapshot =
        await collectionReference.where('category', isEqualTo: category).get();

    List<Category> newsData = [];

    querySnapshot.docs.forEach((documentSnapshot) {
      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;

      Category category = Category(
        title: data['title'],
        description: data['description'],
        image: data['image'],
      );
      newsData.add(category);
    });

    return newsData;
  }
}
