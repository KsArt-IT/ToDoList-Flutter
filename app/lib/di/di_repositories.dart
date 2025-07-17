import 'package:flutter/foundation.dart';
import 'package:todo_fui/data/repositories/auth/firebase_auth_repository.dart';
import 'package:todo_fui/data/repositories/settings/local_settings_repository.dart';
import 'package:todo_fui/di/di_container.dart';
import 'package:todo_fui/domain/repositories.dart';

/// {@template di_repositories}
/// Класс для инициализации и управления репозиториями программы.
///
/// Отвечает за:
/// - Инициализацию репозиториев для работы с данными
/// - Обработку ошибок инициализации репозиториев
/// - Ленивую инициализацию репозиториев
/// {@endtemplate}
final class DiRepositories {
  /// {@macro di_repositories}
  DiRepositories();

  /// Репозиторий для работы с Firebase Auth
  late final AuthRepository authRepository;

  /// Репозиторий для работы с настройками
  late final SettingsRepository settingsRepository;

  /// Метод для инициализации репозиториев в программе.
  ///
  /// Принимает:
  /// - [diContainer] - контейнер зависимостей с конфигурацией программы
  ///
  /// Последовательность инициализации:
  /// 1. Инициализация репозитория для работы с Firebase Auth
  /// 2. Инициализация репозитория настроек
  void init({required DiContainer diContainer}) {
    try {
      debugPrint('DiRepositories:: init AuthRepository');
      // Инициализация репозитория для работы с Firebase Auth
      authRepository = _lazyInitRepo<AuthRepository>(
        mainFactory: () => FirebaseAuthRepository(
          firebaseAuth: diContainer.services.firebaseAuth,
          googleSignIn: diContainer.services.googleSignIn,
        ),
      );
    } on Object catch (error, stackTrace) {
      debugPrint('DiRepositories:: init AuthRepository error: $error');
      return;
    }
    try {
      debugPrint('DiRepositories:: init SettingsRepository');
      // Инициализация репозитория настроек приложения
      settingsRepository = _lazyInitRepo<SettingsRepository>(
        mainFactory: () => LocalSettingsRepository(
          storage: diContainer.services.storageService,
        ),
      );
    } on Object catch (error, stackTrace) {
      debugPrint('DiRepositories:: init SettingsRepository error: $error');
      return;
    }
  }

  T _lazyInitRepo<T>({required T Function() mainFactory}) => mainFactory();
}
