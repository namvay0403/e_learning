import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../teachers/model/teacher_model.dart';
import '../utilities/constants/list_provider.dart';

part 'filter_teachers_state.dart';

class FilterTeachersCubit extends Cubit<FilterTeachersState> {
  FilterTeachersCubit() : super(FilterTeachersInitial());

  void filter({required String specific}) {
    for (int i = 0; i < teachers.length; i++) {
      var teacher = teachers[i];
      // if (teacher.specialities.contains(specific)) {
      //   if (filterListTeachers.indexOf(teacher) == -1) {
      //     filterListTeachers.add(teacher);
      //   }
      // }
    }
    for (int i = 0; i < filterListTeachers.length; i++) {
      var teacher = filterListTeachers[i];
      print(teacher.id);
    }
    emit(FilterTeachersSuccess(filterTeachers: filterListTeachers));
  }

  void resetFilter() {
    filterListTeachers = [];
    emit(FilterTeachersFailed());
  }

  void find({required String text}) {
    print(teachers.length);
    filterListTeachers = teachers.where((e) {
      var name = e.name.toLowerCase();
      return name.contains(text);
    }).toList();
    emit(FilterTeachersSuccess(filterTeachers: filterListTeachers));
  }
}
