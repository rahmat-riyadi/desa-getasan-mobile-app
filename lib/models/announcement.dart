import 'dart:convert';

Announcement announcementFromJson(String str) => Announcement.fromJson(json.decode(str));

String announcementToJson(Announcement data) => json.encode(data.toJson());

class Announcement {
    Announcement({
        required this.id,
        required this.title,
        required this.slug,
        required this.articleCategory,
        required this.image,
        required this.description,
        required this.time,
        required this.date,
        required this.updatedBy,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    String title;
    String slug;
    String articleCategory;
    String image;
    String description;
    String time;
    DateTime date;
    String updatedBy;
    DateTime createdAt;
    DateTime updatedAt;

    factory Announcement.fromJson(Map<String, dynamic> json) => Announcement(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        articleCategory: json["article_category"],
        image: json["image"],
        description: json["description"],
        time: json["time"],
        date: DateTime.parse(json["date"]),
        updatedBy: json["updated_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "article_category": articleCategory,
        "image": image,
        "description": description,
        "time": time,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "updated_by": updatedBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
