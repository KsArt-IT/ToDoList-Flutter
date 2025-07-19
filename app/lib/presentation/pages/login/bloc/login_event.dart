part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

final class EmailUnfocused extends LoginEvent {}

final class PasswordUnfocused extends LoginEvent {}

final class EmailChanged extends LoginEvent {
  final String email;

  const EmailChanged({required this.email});

  @override
  List<Object?> get props => [email];
}

final class PasswordChanged extends LoginEvent {
  final String password;

  const PasswordChanged({required this.password});
  
  @override
  List<Object?> get props => [password];
}

final class LoginRequested extends LoginEvent {}

final class LoginWithGoogleRequested extends LoginEvent {}