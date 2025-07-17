import 'package:todo_fui/domain/entities/result.dart';
import 'package:todo_fui/domain/entities/user_entity.dart';

/// {@template auth_repository}
/// Репозиторий для работы с Auth.
/// {@endtemplate}
abstract interface class AuthRepository {
  /// Проверить, вошел ли пользователь в систему
  Future<bool> checkIsSignIn();

  /// Получить текущего пользователя
  Future<Result<UserEntity>> getCurrentUser();

  /// Войти в систему с помощью email и пароля
  Future<Result<UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Зарегистрироваться с помощью email и пароля
  Future<Result<UserEntity>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Войти в систему с помощью Google
  Future<Result<UserEntity>> signInWithGoogle();

  /// Выйти из системы
  Future<Result<void>> signOut();

  /// Отправить email для сброса пароля
  Future<Result<void>> sendPasswordResetEmail(String email);
}
