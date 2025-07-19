import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_fui/domain/entities/email.dart';
import 'package:todo_fui/domain/entities/password.dart';
import 'package:todo_fui/domain/entities/state_status.dart';
import 'package:todo_fui/domain/entities/user_entity.dart';
import 'package:todo_fui/domain/usecases/auth_use_cases.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SignInWithEmailAndPasswordUseCase _signInWithEmailAndPasswordUseCase;
  final SignInWithGoogleUseCase _signInWithGoogleUseCase;

  LoginBloc({
    required SignInWithEmailAndPasswordUseCase
    signInWithEmailAndPasswordUseCase,
    required SignInWithGoogleUseCase signInWithGoogleUseCase,
  }) : _signInWithEmailAndPasswordUseCase = signInWithEmailAndPasswordUseCase,
       _signInWithGoogleUseCase = signInWithGoogleUseCase,
       super(const LoginState()) {
    on<EmailUnfocused>(_onEmailUnfocused);
    on<PasswordUnfocused>(_onPasswordUnfocused);
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginRequested>(_onLoginRequested);
    on<LoginWithGoogleRequested>(_onLoginWithGoogleRequested);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    final email = Email(value: event.email);
    emit(
      state.copyWith(
        email: email,
        isValid: email.isValid && state.password.isValid,
        status: StateStatus.initial,
      ),
    );
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    final password = Password(value: event.password);
    emit(
      state.copyWith(
        password: password,
        isValid: state.email.isValid && password.isValid,
        status: StateStatus.initial,
      ),
    );
  }

  void _onEmailUnfocused(EmailUnfocused event, Emitter<LoginState> emit) {
    final email = Email(value: state.email.value);
    emit(
      state.copyWith(
        email: email,
        isValid: email.isValid && state.password.isValid,
        status: StateStatus.initial,
      ),
    );
  }

  void _onPasswordUnfocused(PasswordUnfocused event, Emitter<LoginState> emit) {
    final password = Password(value: state.password.value);
    emit(
      state.copyWith(
        password: password,
        isValid: state.email.isValid && password.isValid,
        status: StateStatus.initial,
      ),
    );
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<LoginState> emit,
  ) async {
    if (!state.isValid) return;
    emit(state.copyWith(status: StateStatus.loading));
    final result = await _signInWithEmailAndPasswordUseCase(
      email: state.email.value,
      password: state.password.value,
    );
    result.map(
      onSuccess: (user) {
        emit(state.copyWith(status: StateStatus.success, user: user));
      },
      onFailure: (error) {
        emit(
          state.copyWith(
            errorMessage: error.toString(),
            status: StateStatus.error,
          ),
        );
      },
    );
  }

  Future<void> _onLoginWithGoogleRequested(
    LoginWithGoogleRequested event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(status: StateStatus.loading));
    final result = await _signInWithGoogleUseCase();
    result.map(
      onSuccess: (user) {
        emit(state.copyWith(status: StateStatus.success, user: user));
      },
      onFailure: (error) {
        emit(
          state.copyWith(
            errorMessage: error.toString(),
            status: StateStatus.error,
          ),
        );
      },
    );
  }
}
