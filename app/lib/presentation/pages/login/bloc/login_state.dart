part of 'login_bloc.dart';

final class LoginState extends Equatable {
  final StateStatus status;
  final UserEntity? user;
  final Email email;
  final Password password;
  final bool isValid;
  final String? errorMessage;

  const LoginState({
    this.status = StateStatus.initial,
    this.user,
    this.email = const Email(value: ''),
    this.password = const Password(value: ''),
    this.isValid = false,
    this.errorMessage,
  });

  LoginState copyWith({
    StateStatus? status,
    UserEntity? user,
    Email? email,
    Password? password,
    bool? isValid,
    String? errorMessage,
  }) {
    return LoginState(
      status: status ?? this.status,
      user: user ?? this.user,
      email: email ?? this.email,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    user,
    email,
    password,
    isValid,
    errorMessage,
  ];
}
