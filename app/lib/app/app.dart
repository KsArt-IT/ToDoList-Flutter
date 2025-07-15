import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_fui/app/app_error_screen.dart';
import 'package:todo_fui/app/app_material.dart';
import 'package:todo_fui/app/app_providers.dart';
import 'package:todo_fui/di/di_container.dart';
import 'package:todo_fui/presentation/localization/localization_consumer.dart';
import 'package:todo_fui/presentation/pages.dart';
import 'package:todo_fui/presentation/theme/theme_consumer.dart';

/// {@template app}
/// Главный виджет приложения, который управляет инициализацией зависимостей
/// и отображением основного интерфейса приложения.
///
/// Отвечает за:
/// - Инициализацию зависимостей приложения
/// - Отображение экрана загрузки во время инициализации
/// - Обработку ошибок инициализации
/// - Выбор провайдеров для их локализации
/// {@endtemplate}
class App extends StatefulWidget {
  /// {@macro app}
  const App({required this.router, required this.initDependencies, super.key});

  /// Роутер для навигации между экранами в приложении
  final GoRouter router;

  /// Функция для инициализации зависимостей приложения
  /// Возвращает Future с контейнером зависимостей
  final Future<DiContainer> Function() initDependencies;

  @override
  State<App> createState() => _AppState();
}

/// {@template app_state}
/// Состояние главного виджета приложения.
///
/// Управляет процессом инициализации зависимостей и отображением
/// соответствующих экранов в зависимости от состояния инициализации.
/// {@endtemplate}
class _AppState extends State<App> {
  /// {@macro app_state}
  _AppState();

  /// Мутабельная Future для инициализации зависимостей
  /// Позволяет перезапускать инициализацию при ошибках
  late Future<DiContainer> _initFuture;

  @override
  void initState() {
    super.initState();
    _initFuture = widget.initDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DiContainer>(
      future: _initFuture,
      builder: (_, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
            // Пока инициализация показываем SplashPage
            return const SplashPage();
          case ConnectionState.done:
            // Отобразить ошибки инициализации
            if (snapshot.hasError) {
              return AppErrorScreen(
                error: snapshot.error,
                stackTrace: snapshot.stackTrace,
                onRetry: _retryInit,
              );
            }
            if (snapshot.data == null) {
              return AppErrorScreen(
                error: 'Зависимости не были созданы.',
                stackTrace: null,
                onRetry: _retryInit,
              );
            }
            // Провайдеры темы, локализации и глобальных зависимостей
            return AppProviders(
              diContainer: snapshot.data!,
              child: LocalizationConsumer(
                builder: () => ThemeConsumer(
                  builder: () => AppMaterial(router: widget.router),
                ),
              ),
            );
        }
      },
    );
  }

  /// Метод для перезапуска инициализации зависимостей
  /// Вызывается при ошибках инициализации для повторной попытки
  void _retryInit() {
    setState(() {
      _initFuture = widget.initDependencies();
    });
  }
}
