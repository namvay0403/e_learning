import 'package:bloc/bloc.dart';
import 'package:e_learning/utilities/constants/list_provider.dart';
import 'package:meta/meta.dart';

import '../model/teacher_model.dart';

part 'favourite_teacher_state.dart';

class FavouriteTeacherCubit extends Cubit<FavouriteTeacherState> {
  FavouriteTeacherCubit() : super(FavouriteTeacherInitial());

  void addFavouriteTeacher({required int id}) {
    teachers[id].isFavourite = !teachers[id].isFavourite;
    emit(FavouriteTeacherSuccess(teachers: teachers));
  }

  void filterTeacherBaseOnRating() {
    for (int i = 0; i < teachers.length - 1; i++) {
      if (teachers[i].rating < teachers[i + 1].rating) {
        final temp = teachers[i];
        teachers[i] = teachers[i + 1];
        teachers[i + 1] = temp;
      }
    }

    for (int i = 0; i < teachers.length; i++) {
      teachers[i].id = i;
    }
  }
}
