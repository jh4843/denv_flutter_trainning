// login usecase class in data layer to implement the repository

import '../../core/type_defs.dart';
import '../../domain/models/user_model.dart';
import '../../domain/repositories/user_repository.dart';

class SignInUseCase {
  final UserRepository userRepository;

  SignInUseCase({required this.userRepository});

  FutureEither<UserModel> signin(SignInType type,
      {String? id, String? email, String? password}) async {
    return await userRepository.signIn(type,
        id: id, email: email, password: password);
  }
}
