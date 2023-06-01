class Category {
  final String title;
  final String description;
  final String? image;

  Category(
      {required this.title, required this.description, required this.image});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      title: json["title"],
      description: json["description"],
      image: json["image"],
    );
  }
}
