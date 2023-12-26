import 'package:bloc/bloc.dart';
import 'package:e_learning/profile/repo/repo.dart';
import 'package:meta/meta.dart';

import '../../../authenticate/model/user_model.dart';
import '../../../utilities/constants/list_provider.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial());

  Future<void> updateProfile(String fullName, String country) async {
    emit(UpdateProfileLoading());
    try {
      user = await ProfileRepo().updateProfile(fullName, country);
      emit(UpdateProfileSuccess(user));
    } catch (e) {
      emit(UpdateProfileFailed(e.toString()));
    }
  }
}
