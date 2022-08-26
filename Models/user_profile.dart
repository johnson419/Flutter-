class UserProfile {
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  UserProfile(
      {required this.email,
      required this.firstName,
      required this.lastName,
      required this.avatar});

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      email: json["email"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      avatar: json["avatar"],
    );
  }
}
