/// {@template storage_service}
/// Interface for working with application settings
/// {@endtemplate}
abstract interface class StorageService {
  /// Reading a value from the storage
  Future<T?> read<T>(String key);

  /// Writing a value to the storage
  Future<void> write<T>(String key, T value);

  /// Deleting a value from the storage
  Future<void> delete(String key);

  /// Clearing the storage
  Future<void> clear();
}