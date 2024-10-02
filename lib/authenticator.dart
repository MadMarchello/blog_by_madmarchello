import 'package:blog_by_madmarchello/user.dart';

class Authenticator {
  static const _users = {
    'admin': User(id: '1', login: 'admin', password: 'admin'),
    'jack': User(id: '2', login: 'jack', password: 'jack'),
  };

  static const _passwords = {
    'admin': '123',
    'jack': '123',
  };


  User? findByloginAndPassword({
    required String login,
    required String password,
  }) {
    final user = _users[login];

    if(user != null && _passwords[login] == password) {
      return user;
    }

    return null;
  }
}
