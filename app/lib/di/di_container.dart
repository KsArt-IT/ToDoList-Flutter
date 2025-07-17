import 'package:flutter/foundation.dart';
import 'package:todo_fui/di/di_repositories.dart';
import 'package:todo_fui/di/di_services.dart';

/// {@template di_container}
/// Класс для инициализации и управления зависимостями программы.
/// {@endtemplate}
final class DiContainer {
  /// {@macro di_container}
  DiContainer();

  /// Сервисы приложения
  late final DiServices services;

  /// Репозитории приложения
  late final DiRepositories repositories;

  /// Метод для инициализации зависимостей
  Future<void> init() async {
    debugPrint('DiContainer::init: ok');
    // Инициализация сервисов
    services = DiServices();
    await services.init();
    // Инициализация репозиториев
    repositories = DiRepositories()..init(diContainer: this);
  }
}
