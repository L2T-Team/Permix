import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permix/util/constant.dart';

import '../model/user.dart' as permix_user;
import '../repository/auth-repository.dart';

class UserData {
  UserData({required this.user, this.error = ''});

  UserData.clone(UserData old)
      : user = old.user,
        error = old.error;

  permix_user.User user;
  String error;
}

class AuthNotifier extends StateNotifier<UserData> {
  AuthNotifier(UserData initialUser) : super(initialUser);

  Future<void> login(String email, String password) async {
    UserData newUserData = UserData.clone(state);
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      newUserData.user = permix_user.User(
        id: credential.user!.uid,
        email: credential.user!.email,
        name: credential.user!.displayName,
        isAdmin: email == ADMIN_EMAIL,
      );
      //TODO: change this to display name when possible.
      newUserData.error = '';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        newUserData.error = 'No user found for that email';
      } else if (e.code == 'wrong-password') {
        newUserData.error = 'Wrong password';
      }
    }
    state = newUserData;
  }

  void logOut() {
    state = UserData(
      user: const permix_user.User(id: '', name: '', email: ''),
    );
  }

  Future<void> signUp(String email, String password, String name) async {
    UserData newUserData = UserData.clone(state);
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await credential.user!.updateDisplayName(name);
      var credenUser = credential.user!;

      newUserData.user = permix_user.User(
        id: credenUser.uid,
        email: credenUser.email,
        name: credenUser.displayName,
      );
      newUserData.error = '';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        newUserData.error = 'This password is too weak';
      } else if (e.code == 'email-already-in-use') {
        newUserData.error = 'This email is already in use';
      }
    } catch (e) {
      newUserData.error = e.toString();
    }
    state = newUserData;
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, UserData?>((ref) {
  return AuthNotifier(
    UserData(
      user: const permix_user.User(id: '', name: '', email: ''),
    ),
  );
});
