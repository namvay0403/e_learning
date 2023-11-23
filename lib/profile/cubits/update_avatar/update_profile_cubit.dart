import 'package:bloc/bloc.dart';
import 'package:e_learning/profile/repo/repo.dart';
import 'package:meta/meta.dart';

import '../../../authenticate/model/user_model.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit({required this.changeProfile})
      : super(UpdateProfileInitial());

  ChangeProfile changeProfile;

  void updateProfile({required User newUser}) {
    bool result = changeProfile.UpdateInfo(newUser: newUser);
    emit(UpdateProfileSuccess());
  }
}
