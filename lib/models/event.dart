import 'dart:convert';

List<Event> eventFromJson(String str) =>
    List<Event>.from(json.decode(str).map((x) => Event.fromJson(x)));

String eventToJson(List<Event> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Event {
  String id;
  String title;
  String body;
  DateTime date;
  String time;
  String image;
  String venue;

  Event({
    required this.id,
    required this.title,
    required this.body,
    required this.date,
    required this.time,
    required this.image,
    required this.venue,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        image: json["image"],
        venue: json["venue"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "time": time,
        "image": image,
        "venue": venue,
      };
}
