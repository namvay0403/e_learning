part of 'get_teachers_cubit.dart';

@immutable
abstract class GetTeachersState {}

class GetTeachersInitial extends GetTeachersState {}

class GetTeachersLoading extends GetTeachersState {}

class GetTeachersLoaded extends GetTeachersState {
  List<Teacher> teachers;
  GetTeachersLoaded(this.teachers);
}

class GetTeachersFailed extends GetTeachersState {
  String message;
  GetTeachersFailed(this.message);
}
