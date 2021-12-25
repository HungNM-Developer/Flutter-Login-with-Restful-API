part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoginLoading extends AuthState {}

class AuthLoginSuccess extends AuthState {
  final User user;

  AuthLoginSuccess(this.user);
}

class AuthLoginError extends AuthState {
  final String message;

  AuthLoginError(this.message);
}

class AuthLogoutSuccess extends AuthState {
  final String message;

  AuthLogoutSuccess(this.message);
}

class AuthLogoutError extends AuthState {
  final String message;

  AuthLogoutError(this.message);
}
