part of 'favourite_teacher_cubit.dart';

@immutable
abstract class FavouriteTeacherState {}

class FavouriteTeacherInitial extends FavouriteTeacherState {}

class FavouriteTeacherLoading extends FavouriteTeacherState {}

class FavouriteTeacherSuccess extends FavouriteTeacherState {
  final int index;

  FavouriteTeacherSuccess({required this.index});
}

class FavouriteTeacherFailed extends FavouriteTeacherState {
  String message;
  FavouriteTeacherFailed({this.message = 'Failed'});
}
