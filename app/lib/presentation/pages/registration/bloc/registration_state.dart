part of 'registration_bloc.dart';

final class RegistrationState extends Equatable {
  final StateStatus status;
  final Email email;
  final Password password;
  final bool isValid;
  final String? errorMessage;

  const RegistrationState({
    this.status = StateStatus.initial,
    this.email = const Email(value: ''),
    this.password = const Password(value: ''),
    this.isValid = false,
    this.errorMessage,
  });

  RegistrationState copyWith({
    StateStatus? status,
    Email? email,
    Password? password,
    bool? isValid,
    String? errorMessage,
  }) {
    return RegistrationState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, email, password, isValid, errorMessage];
}
