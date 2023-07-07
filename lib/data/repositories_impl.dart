// total repositories implement with riverpod provider

import "package:hooks_riverpod/hooks_riverpod.dart";
import "./repositories/user_repository_impl.dart";

final userProvider = Provider((ref) => UserRepositoryImpl());
