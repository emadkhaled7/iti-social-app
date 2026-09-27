abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoginSuccess extends AuthState {}

class AuthRegisterSuccess extends AuthState {}

class AuthResetPasswordSuccess extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}