class ItemBusinessCategory {
    ItemBusinessCategory({
        required this.id,
        required this.itemCategory,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    String itemCategory;
    DateTime createdAt;
    DateTime updatedAt;

    factory ItemBusinessCategory.fromJson(Map<String, dynamic> json) => ItemBusinessCategory(
        id: json["id"],
        itemCategory: json["item_category"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "item_category": itemCategory,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}