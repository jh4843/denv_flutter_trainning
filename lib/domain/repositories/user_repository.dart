// repository abstract class to login user in domain layer

import "package:denv_flutter_training/core/type_defs.dart";
import "../models/user_model.dart";

abstract class UserRepository {
  FutureEither<UserModel> signIn(SignInType type,
      {String? id, String? email, String? password});

  Future<bool> signOut(UserModel user);

  Future<bool> updateUser(UserModel oldUser, UserModel newUser);
}
