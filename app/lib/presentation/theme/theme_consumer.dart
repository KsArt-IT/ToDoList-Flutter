import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_fui/presentation/theme/theme_notifier.dart';

/// Тип функции для построения виджета с учетом темы
typedef ThemeBuilder = Widget Function();

/// {@template theme_consumer}
/// Виджет для подписки на изменение темы в приложении.
///
/// Автоматически перестраивает дочерние виджеты при смене темы,
/// Обеспечивает реактивность интерфейса к изменениям настроек темы.
/// {@endtemplate}
class ThemeConsumer extends StatelessWidget {
  /// {@macro theme_consumer}
  const ThemeConsumer({required this.builder, super.key});

  /// Функция для построения виджета с учетом текущей темы
  final ThemeBuilder builder;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (_, __, ___) => builder(), //
    );
  }
}
