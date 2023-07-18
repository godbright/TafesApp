class User {
  User({
    this.id,
    this.username,
    this.email,
    this.phone,
    this.password,
  });

  int? id;
  String? username;
  String? email;
  String? phone;
  String? password;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "phone": phone,
        "password": password,
      };
}
