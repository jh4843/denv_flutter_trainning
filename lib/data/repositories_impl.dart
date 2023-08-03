// total repositories implement with riverpod provider

import "package:hooks_riverpod/hooks_riverpod.dart";
import "./repositories/user_repository_impl.dart";
import "./datasources/remote/remote_auth_datasource.dart";
import "package:denv_flutter_training/domain/repositories/user_repository.dart";

final userRepositoryProvider = Provider.autoDispose<UserRepository>(
  (ref) => UserRepositoryImpl(
    remoteAuthDataSource: ref.read(remoteAuthDataSourceProvider),
  ),
);
