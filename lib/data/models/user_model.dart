import 'package:denv_flutter_training/domain/entities/user_entity.dart';

class UserModel extends UserEntity {

  const UserModel({
    required String uid,
    required String name,
    String? email,
    required bool isAuthenticated,
  }) : super(
          uid: uid,
          name: name,
          email: email,
          isAuthenticated: isAuthenticated,
        );

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      isAuthenticated: map['isAuthenticated'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'isAuthenticated': isAuthenticated,
    };
  }
}
