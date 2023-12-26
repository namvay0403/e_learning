part of 'update_profile_cubit.dart';

@immutable
abstract class UpdateProfileState {}

class UpdateProfileInitial extends UpdateProfileState {}

class UpdateProfileLoading extends UpdateProfileState {}

class UpdateProfileSuccess extends UpdateProfileState {
  final User user;
  UpdateProfileSuccess(this.user);
}

class UpdateProfileFailed extends UpdateProfileState {
  final String message;
  UpdateProfileFailed(this.message);
}
