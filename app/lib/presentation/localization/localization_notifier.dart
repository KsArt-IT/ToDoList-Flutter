import 'package:flutter/material.dart';
import 'package:todo_fui/domain/repositories/settings/settings_repository.dart';

/// {@template localization_notifier}
/// Класс для управления локализацией в приложении.
///
/// Отвечает за:
/// - Хранение текущей локали приложения
/// - Уведомление подписчиков о изменении языка
/// - Переключение между поддерживаемыми языками
/// {@endtemplate}
final class LocalizationNotifier extends ChangeNotifier {
  /// {@macro localization_notifier}
  LocalizationNotifier({required SettingsRepository settingsRepository})
    : _settingsRepository = settingsRepository {
    _settingsRepository.loadLocale().then((locale) {
      changeLocale(locale != null ? Locale(locale) : null);
    });
  }

  final SettingsRepository _settingsRepository;

  /// Системный режим
  bool _isSystemMode = true;
  bool get isSystemMode => _isSystemMode;

  /// Текущая локаль в приложении
  Locale _locale = WidgetsBinding.instance.platformDispatcher.locale;

  /// Получение текущей локали в приложении
  Locale get locale => _locale;

  /// Получение текущей языка как код языка
  String get language => locale.languageCode;

  /// Метод для изменения локали приложения.
  ///
  /// Принимает:
  /// - [locale] - новая локаль для установки в приложении
  ///
  /// уведомляет всех подписчиков о изменении локали.
  void changeLocale(Locale? locale) {
    final newLocale =
        locale ?? WidgetsBinding.instance.platformDispatcher.locale;
    if (_locale != newLocale || _isSystemMode != (locale == null)) {
      _isSystemMode = locale == null;
      _locale = newLocale;
      _settingsRepository.saveLocale(locale?.languageCode);
      notifyListeners();
    }
  }
}
