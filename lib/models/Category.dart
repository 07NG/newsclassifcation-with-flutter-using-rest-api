class Category {
  final String title;
  final String description;

  Category({required this.title, required this.description});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      title: json["title"],
      description: json["description"],
    );
  }
}
