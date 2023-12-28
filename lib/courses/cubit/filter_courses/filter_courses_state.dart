part of 'filter_courses_cubit.dart';

@immutable
abstract class FilterCoursesState {}

class FilterCoursesInitial extends FilterCoursesState {}

class FilterCoursesLoading extends FilterCoursesState {}

class FilterCoursesLoaded extends FilterCoursesState {
  final List<Course> courses;

  FilterCoursesLoaded(this.courses);
}

class FilterCoursesFailed extends FilterCoursesState {
  final String message;

  FilterCoursesFailed(this.message);
}
