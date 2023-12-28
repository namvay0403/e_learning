import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../utilities/constants/list_provider.dart';
import '../../model/course_model.dart';
import '../../repo/course_repo.dart';

part 'filter_courses_state.dart';

class FilterCoursesCubit extends Cubit<FilterCoursesState> {
  FilterCoursesCubit() : super(FilterCoursesInitial());

  Future<void> filter(String text) async {
    emit(FilterCoursesLoading());
    try {
      filterCourses = await CourseRepo().filter(text);
      emit(FilterCoursesLoaded(filterCourses));
    } catch (e) {
      emit(FilterCoursesFailed(e.toString()));
    }
  }

  void reset() {
    filterCourses = [];
    emit(FilterCoursesInitial());
  }
}
