import 'package:get_storage/get_storage.dart';
import 'package:todo_fui/data/services/storage/storage_service.dart';

/// {@template get_storage_service}
/// Implementation of StorageService for working with GetStorage.
/// {@endtemplate}
final class GetStorageService implements StorageService {
  /// Flag to check if GetStorage is initialized.
  static bool _isInitialized = false;

  /// Initialize GetStorage.
  static Future<StorageService> init() async {
    if (!_isInitialized) {
      await GetStorage.init();
      _isInitialized = true;
    }
    return GetStorageService._();
  }

  /// {@macro get_storage_service}
  GetStorageService._();

  final GetStorage _box = GetStorage();

  @override
  Future<T?> read<T>(String key) async {
    return _box.read(key);
  }

  @override
  Future<void> write<T>(String key, T value) {
    return _box.write(key, value);
  }

  @override
  Future<void> delete(String key) {
    return _box.remove(key);
  }

  @override
  Future<void> clear() {
    return _box.erase();
  }
}
