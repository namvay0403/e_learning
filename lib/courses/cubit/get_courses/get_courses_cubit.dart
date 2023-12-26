import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/course_model.dart';
import '../../repo/course_repo.dart';

part 'get_courses_state.dart';

class GetCoursesCubit extends Cubit<GetCoursesState> {
  GetCoursesCubit() : super(GetCoursesInitial());

  Future<void> getCourses() async {
    emit(GetCoursesLoading());
    try {
      final courses = await CourseRepo().getCourses();
      emit(GetCoursesLoaded(courses: courses));
    } catch (e) {
      emit(GetCoursesFailed(message: e.toString()));
    }
  }
}
