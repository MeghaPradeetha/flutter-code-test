import 'package:flutter/material.dart';
import '../models/user.dart';
import '../repositories/user_repository.dart';

class UserProvider with ChangeNotifier {
  final UserRepository _userRepository = UserRepository();
  User? _user;
  String _error = '';

  User? get user => _user;
  String get error => _error;

  void loadUser() async {
    try {
      _user = await _userRepository.fetchUser();
      _error = '';
      notifyListeners();
    } catch (e) {
      _error = 'Failed to load user';
      notifyListeners();
    }
  }
}
