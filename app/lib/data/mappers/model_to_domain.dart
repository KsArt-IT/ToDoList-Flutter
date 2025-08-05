import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_fui/domain/entities/user_entity.dart';

extension UserToDomain on User {
  UserEntity toDomain() {
    return UserEntity(
      id: uid,
      email: email ?? '',
      name: displayName ?? '',
      avatar: photoURL ?? '',
    );
  }
}