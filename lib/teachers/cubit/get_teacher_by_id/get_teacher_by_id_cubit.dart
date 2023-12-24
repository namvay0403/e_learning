import 'package:bloc/bloc.dart';
import 'package:e_learning/teachers/model/detail_teacher_model.dart';
import 'package:e_learning/teachers/repo/teacher_repo.dart';
import 'package:meta/meta.dart';

import '../../model/teacher_model.dart';

part 'get_teacher_by_id_state.dart';

class GetTeacherByIdCubit extends Cubit<GetTeacherByIdState> {
  GetTeacherByIdCubit() : super(GetTeacherByIdInitial());

  Future<void> getTeacherById(String id) async {
    emit(GetTeacherByIdLoading());
    try {
      DetailTeacher teacher = await TeacherRepo().getTeacherById(id);
      emit(GetTeacherByIdSuccess(teacher));
    } catch (e) {
      emit(GetTeacherByIdFailed(e.toString()));
    }
  }
}
