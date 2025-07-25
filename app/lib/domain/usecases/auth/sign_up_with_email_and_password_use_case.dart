import 'package:todo_fui/domain/entities/result.dart';
import 'package:todo_fui/domain/entities/user_entity.dart';
import 'package:todo_fui/domain/repositories/auth/auth_repository.dart';

class SignUpWithEmailAndPasswordUseCase {
  final AuthRepository _authRepository;

  SignUpWithEmailAndPasswordUseCase(this._authRepository);

  Future<Result<UserEntity>> call({
    required String email,
    required String password,
  }) async {
    return await _authRepository.signUpWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
