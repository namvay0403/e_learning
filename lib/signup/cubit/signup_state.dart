part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  final User user;

  SignupSuccess({required this.user});
}

class SignupFailed extends SignupState {
  final String error;

  SignupFailed({required this.error});
}
