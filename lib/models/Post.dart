class Post {
  final String title;
  final String description;

  Post({required this.title, required this.description});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title'],
      description: json['description'],
    );
  }
}
