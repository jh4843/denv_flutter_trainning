// class for remote database

import 'package:denv_flutter_training/core/failure.dart';
import 'package:denv_flutter_training/core/type_defs.dart';
import 'package:denv_flutter_training/core/providers/firebase_providers.dart';
import 'package:denv_flutter_training/domain/models/user_model.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import "package:dartz/dartz.dart";

final remoteAuthDataSourceProvider = Provider(
  (ref) => RemoteAuthDataSource(
      firestore: ref.read(firestoreProvider),
      auth: ref.read(authProvider),
      googleSignIn: ref.read(googleSignInProvider)),
);

class RemoteAuthDataSource {
  // singleton
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  RemoteAuthDataSource({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
    required GoogleSignIn googleSignIn,
  })  : _auth = auth,
        _firestore = firestore,
        _googleSignIn = googleSignIn;

  FutureEither<UserModel> signIn(SignInType type,
      {String? id, String? email, String? password}) async {
    try {
      switch (type) {
        case SignInType.email:
          final UserCredential userCredential = await _auth
              .signInWithEmailAndPassword(email: email!, password: password!);
          return Right(UserModel.fromFirebaseUser(userCredential.user!));
        case SignInType.google:
          final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
          if (googleUser == null) {
            return const Left(Failure("Google sign in cancelled"));
          }
          final googleAuth = await googleUser.authentication;
          final credential = GoogleAuthProvider.credential(
              accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
          final userCredential = await _auth.signInWithCredential(credential);
          return Right(UserModel.fromFirebaseUser(userCredential.user!));
        default:
          return const Left(Failure("Invalid sign in type"));
      }
    } on FirebaseAuthException catch (e) {
      return Left(Failure(e.message ?? "Unknown error"));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  FutureEither<bool> signOut(UserModel user) async {
    try {
      await _auth.signOut();
      return const Right(true);
    } on FirebaseAuthException catch (e) {
      return Left(Failure(e.message ?? "Unknown error"));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  FutureEither<bool> updateUser(UserModel oldUser, UserModel newUser) async {
    try {
      await _firestore
          .collection("users")
          .doc(oldUser.uid)
          .update(newUser.toJson());
      return const Right(true);
    } on FirebaseException catch (e) {
      return Left(Failure(e.message ?? "Unknown error"));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
