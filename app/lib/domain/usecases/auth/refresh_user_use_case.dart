import 'package:todo_fui/domain/entities/result.dart';
import 'package:todo_fui/domain/entities/user_logged.dart';
import 'package:todo_fui/domain/repositories/auth/auth_repository.dart';

class RefreshUserUseCase {
  final AuthRepository _authRepository;

  RefreshUserUseCase(this._authRepository);

  Future<Result<UserLogged>> call() {
    return _authRepository.refreshUser();
  }
}
