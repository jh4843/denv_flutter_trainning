import "./state/auth_notifier.dart";
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:denv_flutter_training/domain/entities/user_entity.dart';

// provider for AuthNotifier
final authStateNotifierProvider =
    StateNotifierProvider<AuthNotifier, UserEntity?>(
  (ref) => AuthNotifier(ref),
);
