
class User {
  const User({
    required this.id,
    required this.login,
    required this.password,
  });

  /// ID пользователя
  final String id;
  /// Имя пользователя
  final String login;
  /// Пароль пользователя
  final String password;
}
