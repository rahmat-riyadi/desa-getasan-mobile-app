import 'dart:convert';

import 'package:desa_getasan_app/models/item_business_category.dart';
UserBusinessItem userBusinessItemFromJson(String str) => UserBusinessItem.fromJson(json.decode(str));
String userBusinessItemToJson(UserBusinessItem data) => json.encode(data.toJson());

class UserBusinessItem {
    UserBusinessItem({
        required this.id,
        required this.uuid,
        required this.noNik,
        required this.userPhoneNumber,
        required this.itemName,
        required this.itemCategoryId,
        required this.itemImage,
        required this.itemPrice,
        required this.itemDescription,
        required this.itemMarketplaceLink,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        required this.itemBusinessCategory,
    });

    int id;
    String uuid;
    String noNik;
    String userPhoneNumber;
    String itemName;
    String itemCategoryId;
    String itemImage;
    String itemPrice;
    String itemDescription;
    String itemMarketplaceLink;
    String status;
    DateTime createdAt;
    DateTime updatedAt;
    ItemBusinessCategory itemBusinessCategory;

    factory UserBusinessItem.fromJson(Map<String, dynamic> json) => UserBusinessItem(
        id: json["id"],
        uuid: json["uuid"],
        noNik: json["no_nik"],
        userPhoneNumber: json["user_phone_number"],
        itemName: json["item_name"],
        itemCategoryId: json["item_category_id"],
        itemImage: json["item_image"],
        itemPrice: json["item_price"],
        itemDescription: json["item_description"],
        itemMarketplaceLink: json["item_marketplace_link"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        itemBusinessCategory: ItemBusinessCategory.fromJson(json["item_business_category"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "no_nik": noNik,
        "user_phone_number": userPhoneNumber,
        "item_name": itemName,
        "item_category_id": itemCategoryId,
        "item_image": itemImage,
        "item_price": itemPrice,
        "item_description": itemDescription,
        "item_marketplace_link": itemMarketplaceLink,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "item_business_category": itemBusinessCategory.toJson(),
    };
}