class User {
  late final String userId;
  late final String name;
  late final String email;
  late final String profilePicture;
  late final List<String>? favoriteRestaurants;

  User(
      {required this.userId,
      required this.name,
      required this.email,
      required this.profilePicture,
      this.favoriteRestaurants});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    name = json['name'];
    email = json['email'];
    profilePicture = json['profilePicture'];
    favoriteRestaurants = json['favoriteRestaurants'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['name'] = name;
    data['email'] = email;
    data['profilePicture'] = profilePicture;
    data['favoriteRestaurants'] = favoriteRestaurants;
    return data;
  }
}
