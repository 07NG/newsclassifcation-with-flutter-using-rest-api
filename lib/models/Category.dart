class Category {
  final String title;
  final String desc;

  Category({required this.title, required this.desc});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      title: json["title"],
      desc: json["desc"],
    );
  }
}
