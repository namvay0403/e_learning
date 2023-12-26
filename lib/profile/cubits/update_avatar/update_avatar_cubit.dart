import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../authenticate/model/user_model.dart';
import '../../../utilities/constants/list_provider.dart';
import '../../repo/repo.dart';

part 'update_avatar_state.dart';

class UpdateAvatarCubit extends Cubit<UpdateAvatarState> {
  UpdateAvatarCubit() : super(UpdateAvatarInitial());

  Future<void> updateAvatar() async {
    emit(UpdateAvatarLoading());
    try {
      String avatarPath = await ProfileRepo().updateAvatar();
      user.avatar = avatarPath;
      emit(UpdateAvatarSuccess(avatarPath));
    } catch (e) {
      emit(UpdateAvatarFailed(e.toString()));
    }
  }
}
