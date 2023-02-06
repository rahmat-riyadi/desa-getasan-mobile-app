import 'dart:convert';

import 'package:desa_getasan_app/models/user_business_item.dart';

UmkmData umkmDataFromJson(String str) => UmkmData.fromJson(json.decode(str));

String umkmDataToJson(UmkmData data) => json.encode(data.toJson());

class UmkmData {
    UmkmData({
        required this.page,
        required this.result,
        required this.totalPages,
        required this.totalResult,
    });

    int page;
    List<UserBusinessItem> result;
    int totalPages;
    int totalResult;

    factory UmkmData.fromJson(Map<String, dynamic> json) => UmkmData(
        page: json["page"],
        result: List<UserBusinessItem>.from(json["result"].map((x) => UserBusinessItem.fromJson(x))),
        totalPages: json["total_pages"],
        totalResult: json["total_result"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_result": totalResult,
    };
}