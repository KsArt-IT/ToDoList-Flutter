import 'package:todo_fui/domain/entities/result.dart';
import 'package:todo_fui/domain/entities/user_entity.dart';
import 'package:todo_fui/domain/repositories/auth/auth_repository.dart';

class SignInWithEmailAndPasswordUseCase {
  final AuthRepository _authRepository;

  SignInWithEmailAndPasswordUseCase(this._authRepository);

  Future<Result<UserEntity>> call({
    required String email,
    required String password,
  }) async {
    return await _authRepository.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
