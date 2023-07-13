// login usecase class in data layer to implement the repository

import "./auth/signin_usecase.dart";
import 'package:hooks_riverpod/hooks_riverpod.dart';
import "package:denv_flutter_training/data/repositories_impl.dart";

final signInProvider = Provider<SignInUseCase>((ref) {
  return SignInUseCase(userRepository: ref.read(userRepositoryProvider));
});
