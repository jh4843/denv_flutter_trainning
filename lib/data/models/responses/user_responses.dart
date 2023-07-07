import '../../../domain/models/user_model.dart';

class SignInResponse {
  final UserModel user;
  final bool result;

  SignInResponse({
    required this.user,
    required this.result,
  });
}

class UserModelListResponse {
  final List<UserModel> users;

  UserModelListResponse({
    required this.users,
  });

  factory UserModelListResponse.fromJson(List<dynamic> json) {
    return UserModelListResponse(
      users: json.map((e) => UserModel.fromJson(e)).toList(),
    );
  }
}
