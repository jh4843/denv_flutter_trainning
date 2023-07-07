// http reuqest model for UserModel
class SignInRequest {
  final String id;
  final String email;
  final String password;

  SignInRequest({
    required this.id,
    required this.email,
    required this.password,
  });
}
