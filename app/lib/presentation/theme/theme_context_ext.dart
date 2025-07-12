import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_fui/presentation/theme/theme_notifier.dart';

/// Класс, который реализует расширение для контекста приложения
extension ThemeContextExt on BuildContext {
  /// Геттер для получения темы
  ThemeNotifier get theme => read<ThemeNotifier>();
}
