part of 'filter_teachers_cubit.dart';

@immutable
abstract class FilterTeachersState {}

class FilterTeachersInitial extends FilterTeachersState {}

class FilterTeachersLoading extends FilterTeachersState {}

class FilterTeachersSuccess extends FilterTeachersState {
  final List<Teacher> filterTeachers;

  FilterTeachersSuccess({required this.filterTeachers});
}

class FilterTeachersFailed extends FilterTeachersState {}
