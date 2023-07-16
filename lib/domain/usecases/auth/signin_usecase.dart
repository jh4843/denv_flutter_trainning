// login usecase class in data layer to implement the repository

import 'package:denv_flutter_training/core/type_defs.dart';
import 'package:denv_flutter_training/domain/entities/user_entity.dart';
import 'package:denv_flutter_training/domain/repositories/user_repository.dart';

class SignInUseCase {
  final UserRepository userRepository;

  SignInUseCase({required this.userRepository});

  FutureEither<UserEntity> execute(
      {required SignInType type, String? email, String? password}) async {
    return await userRepository.signIn(
        type: type, email: email, password: password);
  }
}
