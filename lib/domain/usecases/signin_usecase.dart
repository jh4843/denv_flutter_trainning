// login usecase class in data layer to implement the repository

import '../../core/type_defs.dart';
import '../../domain/models/user_model.dart';
import '../../domain/repositories/user_repository.dart';

class SignInUseCase {
  final UserRepository loginRepository;

  SignInUseCase({required this.loginRepository});

  FutureEither<UserModel> signin(SignInType type,
      {String? id, String? email, String? password}) async {
    return await loginRepository.signIn(type, id, email, password);
  }
}
