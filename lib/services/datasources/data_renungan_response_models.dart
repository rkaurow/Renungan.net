import 'dart:convert';

class DataRenunganModels {
  final int id;
  final String title;
  final String content;
  final String slug;
  final String excerpt;
  final DateTime date;
  final List<String> categories;
  final String featuredImage;
  final Author author;

  DataRenunganModels({
    required this.id,
    required this.title,
    required this.content,
    required this.slug,
    required this.excerpt,
    required this.date,
    required this.categories,
    required this.featuredImage,
    required this.author,
  });

  factory DataRenunganModels.fromRawJson(String str) =>
      DataRenunganModels.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DataRenunganModels.fromJson(Map<String, dynamic> json) =>
      DataRenunganModels(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        slug: json["slug"],
        excerpt: json["excerpt"],
        date: DateTime.parse(json["date"]),
        categories: List<String>.from(json["categories"].map((x) => x)),
        featuredImage: json["featured_image"],
        author: Author.fromJson(json["author"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "slug": slug,
        "excerpt": excerpt,
        "date": date.toIso8601String(),
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "featured_image": featuredImage,
        "author": author.toJson(),
      };
}

class Author {
  final String id;
  final String name;
  final String avatar;
  final int totalPostsByAuthor;
  final int totalViewsByAuthor;

  Author({
    required this.id,
    required this.name,
    required this.avatar,
    required this.totalPostsByAuthor,
    required this.totalViewsByAuthor,
  });

  factory Author.fromRawJson(String str) => Author.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        id: json["id"],
        name: json["name"],
        avatar: json["avatar"],
        totalPostsByAuthor: json["total_posts_by_author"],
        totalViewsByAuthor: json["total_views_by_author"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "avatar": avatar,
        "total_posts_by_author": totalPostsByAuthor,
        "total_views_by_author": totalViewsByAuthor,
      };
}
