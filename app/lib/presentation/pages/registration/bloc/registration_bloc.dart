import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_fui/domain/entities/email.dart';
import 'package:todo_fui/domain/entities/password.dart';
import 'package:todo_fui/domain/entities/state_status.dart';
import 'package:todo_fui/domain/usecases/auth_use_cases.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final SignUpWithEmailAndPasswordUseCase _signUpWithEmailAndPasswordUseCase;
  final SignOutUseCase _signOutUseCase;

  RegistrationBloc({
    required SignUpWithEmailAndPasswordUseCase signUpWithEmailAndPasswordUseCase,
    required SignOutUseCase signOutUseCase,
  }) : _signUpWithEmailAndPasswordUseCase = signUpWithEmailAndPasswordUseCase,
       _signOutUseCase = signOutUseCase,
       super(RegistrationState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<PasswordConfirmChanged>(_onPasswordConfirmChanged);
    on<RegistrationRequest>(_onRegistrationRequest);
  }

  void _onEmailChanged(EmailChanged event, Emitter<RegistrationState> emit) {
    final email = Email(value: event.email);
    emit(state.copyWith(email: email, status: StateStatus.initial));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<RegistrationState> emit) {
    final password = Password(value: event.password);
    emit(state.copyWith(password: password, status: StateStatus.initial));
  }

  void _onPasswordConfirmChanged(PasswordConfirmChanged event, Emitter<RegistrationState> emit) {
    final passwordConfirm = Password(value: event.password);
    emit(state.copyWith(passwordConfirm: passwordConfirm, status: StateStatus.initial));
  }

  Future<void> _onRegistrationRequest(
    RegistrationRequest event,
    Emitter<RegistrationState> emit,
  ) async {
    if (!state.isValid) return;
    emit(state.copyWith(status: StateStatus.loading));
    final result = await _signUpWithEmailAndPasswordUseCase(
      email: state.email.value,
      password: state.password.value,
    );
    result.map(
      onSuccess: (_) async {
        await _signOutUseCase();
        emit(state.copyWith(status: StateStatus.success));
      },
      onFailure: (error) {
        emit(state.copyWith(errorMessage: error.toString(), status: StateStatus.error));
      },
    );
  }
}
