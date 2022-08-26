class Userinfo {
  final String firstName;
  final String lastName;
  final String avatar;
  final String email;

  Userinfo(
      {required this.firstName,
      required this.lastName,
      required this.avatar,
      required this.email});

  factory Userinfo.fromJson(Map<String, dynamic> json) {
    return Userinfo(
        firstName: json['first_name'],
        lastName: json['last_name'],
        avatar: json['avatar'],
        email: json['email']);
  }
}
