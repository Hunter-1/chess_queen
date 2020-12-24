class User {
  final int id;
  final String username;
  final String password;

  User({this.id, this.username, this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["user_id"] as int,
      username: json["username"] as String,
      password: json["user_password"] as String
    );
  }
}