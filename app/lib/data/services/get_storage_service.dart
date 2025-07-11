import 'package:get_storage/get_storage.dart';
import 'package:todo_fui/data/services/storage_service.dart';

/// {@template get_storage_service}
/// Implementation of StorageService for working with GetStorage.
/// {@endtemplate}
final class GetStorageService implements StorageService {
  static GetStorageService? _instance;

  /// Initialize the singleton GetStorageService.
  /// Returns the StorageService instance.
  static Future<StorageService> init() async {
    if (_instance == null) {
      await GetStorage.init();
      _instance = GetStorageService._();
    }
    return _instance!;
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
