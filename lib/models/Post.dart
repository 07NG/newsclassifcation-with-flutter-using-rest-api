class Post {
  final String title;
  final String description;
  final String category;
  Post({required this.title, required this.description,required this.category});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'category': category,
    };
  }
}
