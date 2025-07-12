import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_fui/l10n/gen/app_localizations.dart';
import 'package:todo_fui/presentation/localization/localization_notifier.dart';

/// Клас, который реализует расширение для контекста приложения
extension LocalizationContextExt on BuildContext {
  /// Геттер для получения локализации
  AppLocalizations get l10n => AppLocalizations.of(this);

  /// Геттер для получения управления локализацией
  LocalizationNotifier get localization => read<LocalizationNotifier>();
}
