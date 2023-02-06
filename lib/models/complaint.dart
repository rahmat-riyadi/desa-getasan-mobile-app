import 'dart:convert';

Complaint complaintFromJson(String str) => Complaint.fromJson(json.decode(str));

String complaintToJson(Complaint data) => json.encode(data.toJson());

class Complaint {
    Complaint({
        required this.name,
        required this.phone,
        required this.email,
        required this.description,
        required this.complaintCategoryId,
    });

    String name;
    String phone;
    String email;
    String description;
    String complaintCategoryId;

    factory Complaint.fromJson(Map<String, dynamic> json) => Complaint(
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        description: json["description"],
        complaintCategoryId: json["complaint_category_id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
        "email": email,
        "description": description,
        "complaint_category_id": complaintCategoryId,
    };
}
