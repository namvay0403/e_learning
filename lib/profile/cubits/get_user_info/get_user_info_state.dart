part of 'get_user_info_cubit.dart';

@immutable
abstract class GetUserInfoState {}

class GetUserInfoInitial extends GetUserInfoState {}

class GetUserInfoLoading extends GetUserInfoState {}

class GetUserInfoSuccess extends GetUserInfoState {
  final User user;

  GetUserInfoSuccess(this.user);
}

class GetUserInfoFailed extends GetUserInfoState {
  final String message;

  GetUserInfoFailed(this.message);
}
