import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_fui/app/app.dart';
import 'package:todo_fui/app/app_bloc_observer.dart';
import 'package:todo_fui/app/app_error_screen.dart';
import 'package:todo_fui/di/di_container.dart';
import 'package:todo_fui/presentation/router/app_router.dart';

/// Время ожидания инициализации зависимостей
/// Если время превышено, то будет показано экран ошибки
/// В дальнейшем необходимо убрать в env
const _initTimeout = Duration(seconds: 7);

/// {@template app_runner}
/// Класс, который реализует раннер для конфигурирования приложения во время запуска
///
/// Порядок инициализации:
/// 1. _initApp - инициализация конфигурации приложения
/// 2. инициализация репозиториев приложения (будет позже)
/// 3. runApp - запуск приложения
/// 4. _onAppLoaded - после запуска приложения
/// {@endtemplate}
class AppRunner {
  /// {@macro app_runner}
  AppRunner();

  /// Роутер приложения
  late GoRouter router;

  /// Метод для запуска приложения
  Future<void> run() async {
    try {
      // Инициализация приложения
      WidgetsFlutterBinding.ensureInitialized();
      // Инициализация для отслеживания Bloc
      Bloc.observer = const AppBlocObserver();

      // Инициализация приложения
      await _initApp();

      // Инициализация роутера
      router = AppRouter.createRouter();

      // throw Exception('Test error');

      runApp(
        App(
          router: router,
          initDependencies: () {
            return _initDependencies().timeout(
              _initTimeout,
              onTimeout: () {
                return Future.error(
                  TimeoutException(
                    'Превышено время ожидания инициализации зависимостей',
                  ),
                );
              },
            );
          },
        ),
      );
      await _onAppLoaded();
    } on Object catch (e, stackTrace) {
      await _onAppLoaded();

      /// Если произошла ошибка во время инициализации приложения,
      /// то запускаем экран ошибок
      runApp(AppErrorScreen(error: e, stackTrace: stackTrace, onRetry: run));
    }
  }

  /// Метод инициализации приложения,
  /// выполняется до запуска приложения
  Future<void> _initApp() async {
    // Запрет на поворот экрана
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    // Заморозка первого кадра (сплеш)
    WidgetsBinding.instance.deferFirstFrame();
  }

  /// Метод срабатывает после запуска приложения
  Future<void> _onAppLoaded() async {
    // Разморозка первого кадра (сплеш)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      WidgetsBinding.instance.allowFirstFrame();
    });
  }

  // Метод для инициализации зависимостей приложения
  Future<DiContainer> _initDependencies() async {
    // Имитация задержки инициализации
    // TODO: Убрать после проверки
    await Future.delayed(const Duration(seconds: 2));
    final diContainer = DiContainer();
    await diContainer.init();
    //throw Exception('Test error');
    return diContainer;
  }
}
