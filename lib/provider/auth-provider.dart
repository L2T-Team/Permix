import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
          name: credential.user!.email);
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
}

final authProvider = StateNotifierProvider<AuthNotifier, UserData?>((ref) {
  return AuthNotifier(
    UserData(
      user: const permix_user.User(id: '', name: '', email: ''),
    ),
  );
});
