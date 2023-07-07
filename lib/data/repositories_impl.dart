// total repositories implement with riverpod provider

import "package:hooks_riverpod/hooks_riverpod.dart";
import "./repositories/user_repository_impl.dart";
import "./datasources/remote/remote_auth_datasource.dart";

final userProvider = Provider(
  (ref) => UserRepositoryImpl(
    remoteAuthDataSource: ref.read(remoteAuthDataSourceProvider),
  ),
);
