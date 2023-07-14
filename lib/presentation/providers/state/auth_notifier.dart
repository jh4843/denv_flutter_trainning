import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:denv_flutter_training/domain/entities/user_entity.dart';
import 'package:denv_flutter_training/domain/usecases/auth_usecase.dart';

class AuthNotifier extends StateNotifier<UserEntity?> {
  final Ref ref;

  AuthNotifier(this.ref) : super(null);

  void setUser(UserEntity? user) {
    state = user;
  }

  void clearUser() {
    state = null;
  }

  Future<void> signIn(SignInType type,
      {String? id, String? email, String? password}) async {
    // update UserEntity? state after sign in(with signInProvider's SignInUseCase)

    final result = await ref
        .read(signInProvider)
        .execute(type: type, id: id, email: email, password: password);

    result.fold(
      (failure) => throw failure,
      (user) => setUser(user),
    );
  }
}

final currentUserState = StateNotifierProvider<AuthNotifier, UserEntity?>(
  (ref) => AuthNotifier(ref),
);

final currentUserModel = Provider<AuthNotifier>((ref) {
  return ref.watch(currentUserState.notifier);
});
