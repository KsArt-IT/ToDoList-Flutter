import 'package:todo_fui/domain/entities/result.dart';
import 'package:todo_fui/domain/entities/user_entity.dart';
import 'package:todo_fui/domain/repositories/auth/auth_repository.dart';

class GetCurrentUserUseCase {
  final AuthRepository _authRepository;

  GetCurrentUserUseCase(this._authRepository);

  Future<Result<UserEntity>> call() {
    return _authRepository.getCurrentUser();
  }
}
