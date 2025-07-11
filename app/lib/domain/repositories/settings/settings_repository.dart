abstract interface class SettingsRepository {
  /// Loading the theme
  Future<bool?> loadTheme();

  /// Saving the theme
  Future<void> saveTheme(bool? isDark);

  /// Saving the locale
  Future<void> saveLocale(String? localeCode);

  /// Loading the locale
  Future<String?> loadLocale();
}
