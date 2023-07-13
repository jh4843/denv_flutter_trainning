//import "package:dartz/dartz.dart";
import "package:denv_flutter_training/data/datasources/remote/remote_auth_datasource.dart";
import 'package:denv_flutter_training/domain/entities/user_entity.dart';
import "package:denv_flutter_training/domain/repositories/user_repository.dart";
import "package:denv_flutter_training/core/type_defs.dart";

//import "package:hooks_riverpod/hooks_riverpod.dart";

// func to implement the repository in data layer
class UserRepositoryImpl implements UserRepository {
  final RemoteAuthDataSource _remoteAuthDataSource;

  UserRepositoryImpl({required remoteAuthDataSource})
      : _remoteAuthDataSource = remoteAuthDataSource;

  @override
  FutureEither<UserEntity> signIn(SignInType type,
      {id, email, password}) async {
    return _remoteAuthDataSource.signIn(type);
  }

  @override
  FutureEither<bool> signOut(UserEntity user) async {
    return _remoteAuthDataSource.signOut(user);
  }

  @override
  FutureEither<bool> updateUser(UserEntity oldUser, UserEntity newUser) async {
    return _remoteAuthDataSource.updateUser(oldUser, newUser);
  }
}
