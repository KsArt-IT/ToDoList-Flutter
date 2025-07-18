import 'package:todo_fui/domain/repositories/auth/auth_repository.dart';

class CheckIsSignInUseCase {
  final AuthRepository _authRepository;

  CheckIsSignInUseCase(this._authRepository);

  Future<bool> call() {
    return _authRepository.checkIsSignIn();
  }
}
