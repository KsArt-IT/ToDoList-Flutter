import 'package:todo_fui/domain/repositories/auth/auth_repository.dart';

class SignOutUseCase {
  final AuthRepository _authRepository;

  SignOutUseCase(this._authRepository);

  Future<void> call() {
    return _authRepository.signOut();
  }
}
