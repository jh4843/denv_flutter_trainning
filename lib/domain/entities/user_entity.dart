import 'package:firebase_auth/firebase_auth.dart';
import 'package:equatable/equatable.dart';

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

class UserEntity extends Equatable {
  final String name;
  final String uid;
  final String? email;
  final bool isAuthenticated; // if guest or not
  const UserEntity({
    required this.name,
    required this.uid,
    this.email,
    required this.isAuthenticated,
  });

  UserEntity copyWith({
    String? name,
    String? uid,
    String? email,
    bool? isAuthenticated,
  }) {
    return UserEntity(
      name: name ?? this.name,
      uid: uid ?? this.uid,
      email: email ?? this.email,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uid': uid,
      'email': email,
      'isAuthenticated': isAuthenticated,
    };
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      isAuthenticated: map['isAuthenticated'] ?? false,
    );
  }

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      name: json['name'],
      uid: json['uid'],
      email: json['email'],
      isAuthenticated: json['isAuthenticated'],
    );
  }

  // factory function from fromFirebaseUser (UserCredential::User in firebase_auth)
  factory UserEntity.fromFirebaseUser(User user) {
    return UserEntity(
      name: user.email ?? user.displayName ?? user.phoneNumber ?? user.uid,
      uid: user.uid,
      email: user.email,
      isAuthenticated: true,
    );
  }

  Map<Object, Object> toJson() {
    return {
      'name': name,
      'uid': uid,
      'email': email ?? "",
      'isAuthenticated': isAuthenticated,
    };
  }

  @override
  List<Object?> get props => [name, uid, email, isAuthenticated];

  @override
  String toString() {
    return 'UserEntity(name: $name, uid: $uid, email: $email, isAuthenticated: $isAuthenticated)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserEntity &&
        other.name == name &&
        other.uid == uid &&
        other.email == email &&
        other.isAuthenticated == isAuthenticated;
  }

  @override
  int get hashCode {
    return name.hashCode ^ uid.hashCode ^ isAuthenticated.hashCode;
  }
}
