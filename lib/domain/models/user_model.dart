import 'package:firebase_auth/firebase_auth.dart';

enum SignInType {
  google,
  facebook,
  apple,
  email,
  phone,
  guest,
  anonymous,
  none,
}

class UserModel {
  final String name;
  final String uid;
  final bool isAuthenticated; // if guest or not
  UserModel({
    required this.name,
    required this.uid,
    required this.isAuthenticated,
  });

  UserModel copyWith({
    String? name,
    String? uid,
    bool? isAuthenticated,
  }) {
    return UserModel(
      name: name ?? this.name,
      uid: uid ?? this.uid,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uid': uid,
      'isAuthenticated': isAuthenticated,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      uid: map['uid'] ?? '',
      isAuthenticated: map['isAuthenticated'] ?? false,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      uid: json['uid'],
      isAuthenticated: json['isAuthenticated'],
    );
  }

  // factory function from fromFirebaseUser (UserCredential::User in firebase_auth)
  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      name: user.email ?? user.displayName ?? user.phoneNumber ?? user.uid,
      uid: user.uid,
      isAuthenticated: true,
    );
  }

  Map<Object, Object> toJson() {
    return {
      'name': name,
      'uid': uid,
      'isAuthenticated': isAuthenticated,
    };
  }

  @override
  String toString() {
    return 'UserModel(name: $name, uid: $uid, isAuthenticated: $isAuthenticated)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.name == name &&
        other.uid == uid &&
        other.isAuthenticated == isAuthenticated;
  }

  @override
  int get hashCode {
    return name.hashCode ^ uid.hashCode ^ isAuthenticated.hashCode;
  }
}
