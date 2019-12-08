import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String username;
  final String email;
  final String bio;
  final String displayName;
  final String photoUrl;

  User({
    this.id,
    this.username,
    this.email,
    this.bio,
    this.displayName,
    this.photoUrl,
  });

  factory User.fromDocument(DocumentSnapshot doc) {
    return User(
      id: doc['id'],
      username: doc['username'],
      email: doc['email'],
      bio: doc['bio'],
      displayName: doc['displayName'],
      photoUrl: doc['photoUrl'],
    );
  }
}
