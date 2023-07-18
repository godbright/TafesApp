// ignore_for_file: constant_identifier_names

// To parse this JSON data, do
//
//     final comments = commentsFromJson(jsonString);

// To parse this JSON data, do
//
//     final comments = commentsFromJson(jsonString);

import 'dart:convert';

List<Comments> commentsFromJson(String str) =>
    List<Comments>.from(json.decode(str).map((x) => Comments.fromJson(x)));

String commentsToJson(List<Comments> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Comments {
  Comments({
    this.id,
    this.username,
    this.postId,
    this.comments,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? username;
  String? postId;
  String? comments;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Comments.fromJson(Map<String, dynamic> json) => Comments(
        id: json["id"],
        username: json["username"],
        postId: json["postId"],
        comments: json["comments"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "postId": postId,
        "comments": comments,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
