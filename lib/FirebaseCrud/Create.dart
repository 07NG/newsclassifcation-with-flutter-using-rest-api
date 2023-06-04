import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_app/models/Post.dart';

class Create {
  void uploadNews(String title, String desc, String cat) {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('category');

    Post post = Post(title: title, description: desc, category: cat);

    collectionReference.add(post.toJson());
  }
}
