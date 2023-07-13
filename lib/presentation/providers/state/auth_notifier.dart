import 'package:denv_flutter_training/domain/repositories/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import "./auth_state.dart";

class AuthNotifier extends StateNotifier<AuthState> {
  final UserRepository userRepository;

  AuthNotifier({
    required this.userRepository,
  }) : super(const AuthState.initial());

  Future<void> signInUser(String username, String password) async {
    state = const AuthState.loading();
    final response = await userRepository.signIn(
      user: User(username: username, password: password),
    );

    state = await response.fold(
      (failure) => AuthState.failure(failure),
      (user) async {
        final hasSavedUser = await userRepository.saveUser(user: user);
        if (hasSavedUser) {
          return const AuthState.success();
        }
        return AuthState.failure(CacheFailureException());
      },
    );
  }

  // AuthNotifier({
  //   required this.userRepository,
  // }) : super(const AuthState.initial());

  // Future<void> loginUser(String username, String password) async {
  //   state = const AuthState.loading();
  //   final response = await userRepository.signIn(
  //     user: User(username: username, password: password),
  //   );

  //   state = await response.fold(
  //     (failure) => AuthState.failure(failure),
  //     (user) async {
  //       final hasSavedUser = await userRepository.saveUser(user: user);
  //       if (hasSavedUser) {
  //         return const AuthState.success();
  //       }
  //       return AuthState.failure(CacheFailureException());
  //     },
  //   );
  // }
}
