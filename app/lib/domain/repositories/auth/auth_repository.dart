import 'package:todo_fui/domain/entities/user_entity.dart';

/// {@template auth_repository}
/// Repository for working with Auth.
/// {@endtemplate}
abstract interface class AuthRepository {
  /// Проверить, вошел ли пользователь в систему
  Future<bool> checkIsSignIn();

  /// Получить текущего пользователя
  Future<UserEntity?> getCurrentUser();

  /// Войти в систему с помощью email и пароля
  Future<UserEntity?> signInWithEmailAndPassword(String email, String password);

  /// Зарегистрироваться с помощью email и пароля
  Future<UserEntity?> signUpWithEmailAndPassword(String email, String password);

  /// Войти в систему с помощью Google
  Future<UserEntity?> signInWithGoogle();

  /// Выйти из системы
  Future<void> signOut();

  /// Отправить email для сброса пароля
  Future<void> sendPasswordResetEmail(String email);
}
