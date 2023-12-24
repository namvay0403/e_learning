import 'package:bloc/bloc.dart';
import 'package:e_learning/utilities/constants/list_provider.dart';
import 'package:meta/meta.dart';

import '../../model/teacher_model.dart';
import '../../repo/teacher_repo.dart';

part 'favourite_teacher_state.dart';

class FavouriteTeacherCubit extends Cubit<FavouriteTeacherState> {
  FavouriteTeacherCubit() : super(FavouriteTeacherInitial());

  Future<void> addFavouriteTeacher({required String id}) async {
    emit(FavouriteTeacherLoading());
    try {
      await TeacherRepo().addTeacherFavourite(id);
      teachers = await TeacherRepo().getTeachers();
      int index = 0;
      for (int i = 0; i < teachers.length; i++) {
        if (teachers[i].id == id) {
          index = i;
          break;
        }
      }
      emit(FavouriteTeacherSuccess(index: index));
    } catch (e) {
      print(e.toString());
      emit(FavouriteTeacherFailed());
    }
  }

  void filterTeacherBaseOnRating() {
    for (int i = 0; i < teachers.length - 1; i++) {
      if (teachers[i].rating < teachers[i + 1].rating) {
        final temp = teachers[i];
        teachers[i] = teachers[i + 1];
        teachers[i + 1] = temp;
      }
    }

    // for (int i = 0; i < teachers.length; i++) {
    //   teachers[i].id = i;
    // }
  }
}
