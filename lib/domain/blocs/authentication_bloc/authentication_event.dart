part of 'authentication_bloc.dart';

@immutable
sealed class AuthEvent {}

class LoginPageEvent extends AuthEvent {
  final String username;
  final String password;

  LoginPageEvent({required this.username, required this.password});
}
