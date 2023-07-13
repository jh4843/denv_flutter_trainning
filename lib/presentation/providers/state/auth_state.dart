// ignore: unused_import
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'auth_state.g.dart';

@riverpod
class AuthState extends _$AuthState {
  @override
  bool build() => false;

  void successLogin() => state = true;
}
