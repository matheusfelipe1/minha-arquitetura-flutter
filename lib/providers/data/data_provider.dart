import 'package:archteture/models/user_model.dart';
import 'package:flutter/material.dart';

class Provider with ChangeNotifier {
  static final Provider _instance = Provider._();
  Provider._();
  factory Provider() => Provider._instance;
  final _userModel = UserModel();

  List<User> _users = [];

  List<User> get users => _users;

  set setUsers(List<User> users) {
    _userModel.setUsers = users;
    _users = users;
  }

  set newUser(User user) {
    _users.add(user);
    _userModel.setUsers = _users;
    _userModel.setUser = User();
    notifyListeners();
  }

  set setUser(User user) {
    _userModel.setUser = user;
    notifyListeners();
  }
}
