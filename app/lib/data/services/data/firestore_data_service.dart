import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_fui/core/domain/firestore/firestore_types.dart';
import 'package:todo_fui/core/domain/firestore/serializable.dart';
import 'package:todo_fui/core/error/app_failure.dart';
import 'package:todo_fui/domain/entities/collections_type.dart';

class FirestoreDataService {
  final FirebaseFirestore _firestore;

  FirestoreDataService({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  Future<FirestoreList<T>> getAll<T>(
    CollectionsType type, {
    String? userId,
  }) => _collection(type.path, userId).get().then(
    (snapshot) => _decodeCollectionSnapshot<T>(snapshot, type.decode),
  );

  Future<FirestoreList<T>> getAllWithParams<T>(
    CollectionsType type, {
    String? equalTo,
    String? userId,
  }) => _collection(type.path, userId)
      .where(type.whereBy, isEqualTo: equalTo)
      .orderBy(type.orderBy, descending: type.descending)
      .get()
      .then(
        (snapshot) => _decodeCollectionSnapshot<T>(snapshot, type.decode),
      );

  Future<T> getByKey<T>(
    CollectionsType type, {
    required String key,
    String? userId,
  }) => _collection(type.path, userId)
      .doc(key)
      .get()
      .then(
        (snapshot) => _decodeEntitySnapshotOrThrow<T>(snapshot, type.decode),
      );

  Future<void> set<T extends Serializable>(
    CollectionsType type, {
    required String key,
    required T entity,
    String? userId,
  }) => _collection(type.path, userId).doc(key).set(entity.toJson());

  Future<void> delete(
    CollectionsType type, {
    required String key,
  }) => _collection(type.path).doc(key).delete();

  /// Returns a [CollectionReference] for the given [collectionPath].
  /// If [userId] is provided, the path is treated as a subcollection
  /// under the user's profile document. 
  CollectionReference<JsonMap> _collection(String collectionPath, [String? userId]) {
    assert(
      !collectionPath.startsWith('/'),
      'the collection path should not start with a slash: $collectionPath',
    );

    final parts = userId != null
        ? '${CollectionsType.profile.path}/$userId/$collectionPath'.split('/')
        : collectionPath.split('/');

    assert(
      parts.length.isOdd,
      'in Firestore, subcollections must be tied to a document '
      '(https://firebase.google.com/docs/firestore/data-model#subcollections)',
    );

    if (parts.length == 1) {
      return _firestore.collection(collectionPath);
    }

    Object query = _firestore.collection(parts.first);

    for (final (index, part) in parts.indexed.skip(1)) {
      query = index.isEven
          ? (query as DocumentReference<JsonMap>).collection(part)
          : (query as CollectionReference<JsonMap>).doc(part);
    }

    return query as CollectionReference<JsonMap>;
  }

  FirestoreList<T> _decodeCollectionSnapshot<T>(
    QuerySnapshot<JsonMap> snapshot,
    Decoder<JsonMap, dynamic> decoder,
  ) => snapshot.docs.map((doc) => (doc.id, decoder(doc.data()) as T)).toList();

  T _decodeEntitySnapshotOrThrow<T>(
    DocumentSnapshot<JsonMap> snapshot,
    Decoder<JsonMap, dynamic> decoder,
  ) {
    final data = snapshot.data();

    try {
      return data != null ? decoder(data) as T : throw Exception('$T');
    } catch (e, stackTrace) {
      throw DecodeFailure(stackTrace, entityName: '$T');
    }
  }
}
