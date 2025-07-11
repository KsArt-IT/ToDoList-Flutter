import 'package:todo_fui/data/services/storage_service.dart';
import 'package:todo_fui/domain/repositories.dart';

/// {@template local_settings_repository}
/// Service for working with application settings
/// {@endtemplate}
final class LocalSettingsRepository implements SettingsRepository {
  /// {@macro local_settings_repository}
  LocalSettingsRepository({required StorageService storage})
    : _storageService = storage;

  final StorageService _storageService;

  @override
  Future<bool?> loadTheme() async {
    return _storageService.read('isDarkTheme');
  }

  @override
  Future<void> saveTheme(bool? isDark) async {
    if (isDark != null) {
      await _storageService.write('isDarkTheme', isDark);
    } else {
      await _storageService.delete('isDarkTheme');
    }
  }

  @override
  Future<String?> loadLocale() async {
    return _storageService.read('locale');
  }

  @override
  Future<void> saveLocale(String? localeCode) async {
    if (localeCode != null) {
      await _storageService.write('locale', localeCode);
    } else {
      await _storageService.delete('locale');
    }
  }
}
