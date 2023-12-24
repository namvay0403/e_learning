part of 'get_teacher_by_id_cubit.dart';

@immutable
abstract class GetTeacherByIdState {}

class GetTeacherByIdInitial extends GetTeacherByIdState {}

class GetTeacherByIdLoading extends GetTeacherByIdState {}

class GetTeacherByIdSuccess extends GetTeacherByIdState {
  DetailTeacher teacher;
  GetTeacherByIdSuccess(this.teacher);
}

class GetTeacherByIdFailed extends GetTeacherByIdState {
  String message;
  GetTeacherByIdFailed(this.message);
}
