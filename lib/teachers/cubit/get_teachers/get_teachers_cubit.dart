import 'package:bloc/bloc.dart';
import 'package:e_learning/teachers/repo/teacher_repo.dart';
import 'package:meta/meta.dart';

import '../../../utilities/constants/list_provider.dart';
import '../../model/teacher_model.dart';

part 'get_teachers_state.dart';

class GetTeachersCubit extends Cubit<GetTeachersState> {
  GetTeachersCubit() : super(GetTeachersInitial());

  Future<void> getTeachers(String pageNumber) async {
    emit(GetTeachersLoading());
    try {
      teachers = await TeacherRepo().getTeachers(pageNumber);
      print(teachers.length);
      emit(GetTeachersLoaded(teachers));
    } catch (e) {
      print(e.toString());
      emit(GetTeachersFailed(e.toString()));
    }
  }

  Future<void> addFavouriteTeacher(
      {required String id, required String pageNumber}) async {
    emit(GetTeachersLoading());
    try {
      await TeacherRepo().addTeacherFavourite(id);
      teachers = await TeacherRepo().getTeachers(pageNumber);
      emit(GetTeachersLoaded(teachers));
    } catch (e) {
      print(e.toString());
      emit(GetTeachersFailed(e.toString()));
    }
  }
}
