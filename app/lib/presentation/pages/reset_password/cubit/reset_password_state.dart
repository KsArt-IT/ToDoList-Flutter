part of 'reset_password_cubit.dart';

class ResetPasswordState extends Equatable {
  final StateStatus status;
  final Email email;
  final String? errorMessage;

  bool get isValid => email.isValid;

    const ResetPasswordState({
    this.status = StateStatus.initial,
    this.email = const Email(value: ''),
    this.errorMessage,
  });

  ResetPasswordState copyWith({Email? email, StateStatus? status, String? errorMessage}) {
    return ResetPasswordState(
      email: email ?? this.email,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [email, status, errorMessage];
}
