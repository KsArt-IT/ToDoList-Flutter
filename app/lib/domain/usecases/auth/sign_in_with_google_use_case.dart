import 'package:todo_fui/domain/entities/result.dart';
import 'package:todo_fui/domain/entities/user_entity.dart';
import 'package:todo_fui/domain/repositories/auth/auth_repository.dart';

class SignInWithGoogleUseCase {
  final AuthRepository _authRepository;

  SignInWithGoogleUseCase(this._authRepository);

  Future<Result<UserEntity>> call() async {
    return await _authRepository.signInWithGoogle();
  }
}
