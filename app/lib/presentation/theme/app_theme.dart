import 'package:flutter/material.dart';
import 'package:todo_fui/presentation/theme/colors/app_colors_scheme.dart';

/// Класс для конфигурации светлой/темной темы программы
abstract class AppTheme {
  /// Получение светлой темы
  static ThemeData get light => ThemeData.light().copyWith(
    extensions: <ThemeExtension<Object?>>[AppColors.light],
  );

  /// Получение темной темы
  static ThemeData get dark => ThemeData.dark().copyWith(
    extensions: <ThemeExtension<Object?>>[AppColors.dark],
  );
}
