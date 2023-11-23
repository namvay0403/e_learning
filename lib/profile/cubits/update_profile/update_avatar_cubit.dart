import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../authenticate/model/user_model.dart';
import '../../repo/repo.dart';

part 'update_avatar_state.dart';

class UpdateAvatarCubit extends Cubit<UpdateAvatarState> {
  UpdateAvatarCubit({required this.changeProfile})
      : super(UpdateAvatarInitial());

  ChangeProfile changeProfile;

  void updateProfile({required String newAvatarPath}) {
    bool result = changeProfile.ChangeAvatar(newAvatar: newAvatarPath);
    emit(UpdateAvatarSuccess());
  }
}
