part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  String message;

  SignupSuccess({required this.message});
}

class SignupFailed extends SignupState {
  final String error;

  SignupFailed({required this.error});
}
