import 'package:flutter/material.dart';
import 'package:instagram_flutter/model/user.dart';
import 'package:instagram_flutter/resources/auth_methods.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final authMethods _authmethods = authMethods();
  User get getUser => _user!;
  Future<void> refreshUser() async {
    User user = await _authmethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
