// repository abstract class to login user in domain layer

import "package:denv_flutter_training/core/type_defs.dart";
import '../entities/user_entity.dart';

abstract class UserRepository {
  FutureEither<UserEntity> signIn(
      {required SignInType type, String? email, String? password});

  FutureEither<bool> signOut(UserEntity user);

  FutureEither<bool> updateUser(UserEntity oldUser, UserEntity newUser);
}
