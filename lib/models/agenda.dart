import 'dart:convert';


Agenda agendaFromJson(String str) => Agenda.fromJson(json.decode(str));

String agendaToJson(Agenda data) => json.encode(data.toJson());

class Agenda {
    Agenda({
        required this.id,
        required this.title,
        required this.slug,
        required this.description,
        required this.author,
        required this.day,
        required this.month,
        required this.dateNum,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    String title;
    String slug;
    String description;
    String author;
    String day;
    String month;
    String dateNum;
    DateTime createdAt;
    DateTime updatedAt;

    factory Agenda.fromJson(Map<String, dynamic> json) => Agenda(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        description: json["description"],
        author: json["author"],
        dateNum: json['date_num'],
        month: json['month'],
        day: json['day'],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "description": description,
        "author": author,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
