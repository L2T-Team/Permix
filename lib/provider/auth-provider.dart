import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/user.dart';
import '../repository/auth-repository.dart';

class UserData {
  UserData({required this.user, this.error = ''});

  User user;
  String error;
}

class AuthNotifier extends StateNotifier<UserData> {
  AuthNotifier(UserData initialUser) : super(initialUser);

  Future<void> login(String email, String password) async {
    try {
      state.user = await AuthRepository.mockLogin(email, password);
      state.error = '';
    } catch (e) {
      state.error = e.toString();
    }
  }
}
