import 'package:flutter/material.dart';
import 'package:permix/model/user.dart';

class AuthRepository {
  static Future<User> mockLogin(String email, String password) async {
    await Future.delayed(Duration(seconds: 3));
    if (email != 'test@test.com' || password != '123123') {
      throw Exception('Wrong username & password');
    }
    return User(id: '123', email: 'thinh@thing.com', name: 'abcc');
  }
}
