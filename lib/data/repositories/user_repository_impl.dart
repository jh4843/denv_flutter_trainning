//import "package:dartz/dartz.dart";
import "package:denv_flutter_training/data/datasources/remote/remote_auth_datasource.dart";
import "package:denv_flutter_training/domain/models/user_model.dart";
import "package:denv_flutter_training/domain/repositories/user_repository.dart";
import "package:denv_flutter_training/core/type_defs.dart";

// func to implement the repository in data layer

class UserRepositoryImpl implements UserRepository {
  final RemoteAuthDataSource remoteAuthDataSource;

  UserRepositoryImpl({required this.remoteAuthDataSource});

  @override
  FutureEither<UserModel> signIn(SignInType type, {id, email, password}) async {
    return remoteAuthDataSource.signIn(type);
  }

  @override
  FutureEither<bool> signOut(UserModel user) async {
    return remoteAuthDataSource.signOut(user);
  }

  @override
  FutureEither<bool> updateUser(UserModel oldUser, UserModel newUser) async {
    return remoteAuthDataSource.updateUser(oldUser, newUser);
  }
}
