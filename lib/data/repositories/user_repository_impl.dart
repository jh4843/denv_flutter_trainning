import "package:dartz/dartz.dart";
import "package:denv_flutter_training/domain/models/user_model.dart";
import "package:denv_flutter_training/domain/repositories/user_repository.dart";
import "package:denv_flutter_training/core/failure.dart";
import "package:denv_flutter_training/core/type_defs.dart";

// func to implement the repository in data layer

class UserRepositoryImpl implements UserRepository {
  final LoginDataSource loginDataSource;

  UserRepositoryImpl({required this.loginDataSource});

  @override
  FutureEither<UserModel> signIn(SignInType type, {id, email, password}) async {
    try {
      final user = await loginDataSource.signIn(type);
      return Right(user);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<bool> signOut(UserModel user) async {
    try {
      final isSignOut = await loginDataSource.signOut(user);
      return isSignOut;
    } on Failure {
      return false;
    }
  }

  @override
  Future<bool> updateUser(UserModel oldUser, UserModel newUser) async {
    try {
      final isUpdated = await loginDataSource.updateUser(oldUser, newUser);
      return isUpdated;
    } on Failure {
      return false;
    }
  }
}
