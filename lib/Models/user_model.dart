class User {
  String? email;
  String? password;

  User({this.email, this.password});

  factory User.fromJson(Map<String, dynamic> json) =>
      User(email: json['email'], password: json['password']);
}
