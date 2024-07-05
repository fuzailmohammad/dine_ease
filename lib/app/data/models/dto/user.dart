import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class User {
  late final String uid;
  late final String email;
  late final String displayName;
  late final String photoURL;

  User({required this.uid, required this.email, required this.displayName, required this.photoURL});

  User.fromFirebaseUser(firebase_auth.User firebaseUser)
      : uid = firebaseUser.uid,
        email = firebaseUser.email ?? '',
        displayName = firebaseUser.displayName ?? '',
        photoURL = firebaseUser.photoURL ?? '';

  User.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        email = json['email'],
        displayName = json['displayName'],
        photoURL = json['photoURL'];

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'photoURL': photoURL,
    };
  }
}
