part of 'get_courses_cubit.dart';

@immutable
abstract class GetCoursesState {}

class GetCoursesInitial extends GetCoursesState {}

class GetCoursesLoading extends GetCoursesState {}

class GetCoursesLoaded extends GetCoursesState {
  List<Course> courses;
  GetCoursesLoaded({required this.courses});
}

class GetCoursesFailed extends GetCoursesState {
  String message;
  GetCoursesFailed({required this.message});
}
