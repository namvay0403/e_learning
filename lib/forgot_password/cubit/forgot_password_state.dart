part of 'forgot_password_cubit.dart';

@immutable
abstract class ForgotPasswordState {}

class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPasswordLoading extends ForgotPasswordState {}

class ForgotPasswordSuccess extends ForgotPasswordState {
  String message;
  ForgotPasswordSuccess({required this.message});
}

class ForgotPasswordFailed extends ForgotPasswordState {
  String message;
  ForgotPasswordFailed({required this.message});
}
