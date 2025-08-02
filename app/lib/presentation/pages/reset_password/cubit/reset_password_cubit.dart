import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_fui/domain/entities/email.dart';
import 'package:todo_fui/domain/entities/state_status.dart';
import 'package:todo_fui/domain/usecases/auth/send_password_reset_email_use_case.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final SendPasswordResetEmailUseCase _sendPasswordResetEmailUseCase;

  ResetPasswordCubit({required SendPasswordResetEmailUseCase sendPasswordResetEmailUseCase})
    : _sendPasswordResetEmailUseCase = sendPasswordResetEmailUseCase,
      super(ResetPasswordState());

  Future<void> resetPassword() async {
    if (!state.isValid) return;
    emit(state.copyWith(status: StateStatus.loading));
    try {
      await _sendPasswordResetEmailUseCase(email: state.email.value);
      emit(state.copyWith(status: StateStatus.success));
    } catch (e) {
      emit(state.copyWith(status: StateStatus.error, errorMessage: e.toString()));
    }
  }

  Future<void> onEmailChanged(String email) async {
    emit(state.copyWith(email: Email(value: email)));
  }
}
