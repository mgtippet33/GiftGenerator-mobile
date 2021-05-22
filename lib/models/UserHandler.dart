import 'package:gift_generator/models/User.dart';

class UserHandler {
  User _user;

  static final UserHandler instance = UserHandler._internal();
  UserHandler._internal() {}

  factory UserHandler(User user) {
    instance._user = user;
    return instance;
  }

  String getUserToken() {
    return _user.token;
  }

  User getUser() {
    return _user;
  }

  void setUser(User user) {
    _user = null;
    _user = user;
  }

  void resetUser(){
    _user = null;
  }
}