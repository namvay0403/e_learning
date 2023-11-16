part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final result;

  LoginSuccess({required this.result});
}

class LoginFailed extends LoginState {
  final error;

  LoginFailed({required this.error});
}
