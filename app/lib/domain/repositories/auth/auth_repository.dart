import 'package:todo_fui/domain/entities/result.dart';
import 'package:todo_fui/domain/entities/user_logged.dart';

/// {@template auth_repository}
/// Репозиторий для работы с Auth.
/// {@endtemplate}
abstract interface class AuthRepository {
  /// Проверить, вошел ли пользователь в систему
  Future<bool> checkIsSignIn();

  /// Получить текущего пользователя
  Future<Result<UserLogged>> getCurrentUser();

  /// Обновить текущего пользователя
  Future<Result<UserLogged>> refreshUser();

  /// Войти в систему с помощью email и пароля
  Future<Result<UserLogged>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Зарегистрироваться с помощью email и пароля
  Future<Result<UserLogged>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Войти в систему с помощью Google
  Future<Result<UserLogged>> signInWithGoogle();

  /// Отправить email для сброса пароля
  Future<Result<void>> sendPasswordResetEmail(String email);

  /// Выйти из системы
  Future<Result<void>> signOut();

  /// Удалить аккаунт
  Future<Result<void>> deleteAccount();
}
