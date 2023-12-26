part of 'update_avatar_cubit.dart';

@immutable
abstract class UpdateAvatarState {}

class UpdateAvatarInitial extends UpdateAvatarState {}

class UpdateAvatarLoading extends UpdateAvatarState {}

class UpdateAvatarSuccess extends UpdateAvatarState {
  final String avatarPath;

  UpdateAvatarSuccess(this.avatarPath);
}

class UpdateAvatarFailed extends UpdateAvatarState {
  final String message;

  UpdateAvatarFailed(this.message);
}
