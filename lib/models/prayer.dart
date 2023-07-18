import 'dart:convert';

List<Prayer> prayerFromJson(String str) => List<Prayer>.from(json.decode(str).map((x) => Prayer.fromJson(x)));

String prayerToJson(List<Prayer> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Prayer {
    int id;
    String userId;
    String prayer;
    DateTime createdAt;
    DateTime updatedAt;

    Prayer({
        required this.id,
        required this.userId,
        required this.prayer,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Prayer.fromJson(Map<String, dynamic> json) => Prayer(
        id: json["id"],
        userId: json["user_id"],
        prayer: json["prayer"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "prayer": prayer,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
