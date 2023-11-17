part of 'favourite_teacher_cubit.dart';

@immutable
abstract class FavouriteTeacherState {}

class FavouriteTeacherInitial extends FavouriteTeacherState {}

class FavouriteTeacherLoading extends FavouriteTeacherState {}

class FavouriteTeacherSuccess extends FavouriteTeacherState {
  final List<Teacher> teachers;

  FavouriteTeacherSuccess({required this.teachers});
}

class FavouriteTeacherFailed extends FavouriteTeacherState {}
