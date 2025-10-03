import 'package:todo_fui/core/domain/exceptions/result.dart';
import 'package:todo_fui/core/domain/exceptions/safe_call_mixin.dart';
import 'package:todo_fui/core/domain/firestore/firestore_types.dart';
import 'package:todo_fui/core/domain/firestore/serializable.dart';
import 'package:todo_fui/data/services/data/firestore_data_service.dart';
import 'package:todo_fui/domain/entities/collections_type.dart';
import 'package:todo_fui/domain/repositories/data/data_repository.dart';
import 'package:uuid/uuid.dart';

final class FirestoreRepositoryImpl with SafeCallMixin implements DataRepository {
  final FirestoreDataService _service;
  final Uuid _uuid;

  const FirestoreRepositoryImpl(this._service, this._uuid);

  @override
  @override
  Future<Result<FirestoreList<T>>> fetchData<T>(
    CollectionsType type, {
    String? equalTo,
    String? userId,
  }) => safeCall(() {
    if (type.orderBy.isEmpty) {
      return _service.getAll<T>(type, userId: userId);
    }
    return _service.getAllWithParams<T>(type, equalTo: equalTo, userId: userId);
  });

  @override
  Future<Result<T>> fetchDataById<T>(
    CollectionsType type, {
    required String id,
    String? userId,
  }) => safeCall(() => _service.getByKey<T>(type, key: id, userId: userId));

  @override
  Future<Result<String>> createData<T extends Serializable>(
    CollectionsType type, {
    required T entity,
    String? userId,
  }) => safeCall(() async {
    final id = _uuid.v4();
    await _service.set(type, key: id, entity: entity, userId: userId);
    return id;
  });

  @override
  Future<Result<void>> updateData<T extends Serializable>(
    CollectionsType type, {
    required String id,
    required T entity,
    String? userId,
  }) => voidSafeCall(() => _service.set(type, key: id, entity: entity, userId: userId));

  @override
  Future<Result<void>> deleteData(
    CollectionsType type, {
    required String id,
  }) => voidSafeCall(() => _service.delete(type, key: id));
}
