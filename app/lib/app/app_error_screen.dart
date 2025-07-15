import 'package:flutter/material.dart';

/// {@template app_error_screen}
/// Экран, когда в приложении произошла критическая ошибка
/// {@endtemplate}
class AppErrorScreen extends StatelessWidget {
  /// {@macro app_error_screen}
  const AppErrorScreen({
    required this.error,
    required this.stackTrace,
    super.key,
    this.onRetry,
  });

  final Object? error;
  final StackTrace? stackTrace;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: onRetry,
                  child: const Text('Перезапустить приложение'),
                ),
                const SizedBox(height: 16),
                Text('''
          Что-то пошло не так, попробуйте перезапустить приложение
          error: $error
                stackTrace: $stackTrace
                  ''', textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
