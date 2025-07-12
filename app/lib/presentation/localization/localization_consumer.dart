import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_fui/presentation/localization/localization_notifier.dart';

/// Тип функции для построения виджета с учетом локализации
typedef LocalizationBuilder = Widget Function();

/// {@template localization_consumer}
/// Виджет для подписки на изменения локализации в приложении.
///
/// Автоматически перестраивает дочерние виджеты при изменении языка,
/// обеспечивает реактивность интерфейса для изменений настроек локализации.
/// {@endtemplate}
class LocalizationConsumer extends StatelessWidget {
  /// {@macro localization_consumer}
  const LocalizationConsumer({required this.builder, super.key});

  /// Функция для построения виджета с учетом текущей локализации
  final LocalizationBuilder builder;

  @override
  Widget build(BuildContext context) {
    return Consumer<LocalizationNotifier>(
      builder: (_, __, ___) => builder(),
    );
  }
}
