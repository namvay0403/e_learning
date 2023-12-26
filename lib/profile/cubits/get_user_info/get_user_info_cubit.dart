import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../authenticate/model/user_model.dart';
import '../../../utilities/constants/list_provider.dart';
import '../../repo/repo.dart';

part 'get_user_info_state.dart';

class GetUserInfoCubit extends Cubit<GetUserInfoState> {
  GetUserInfoCubit() : super(GetUserInfoInitial());

  Future<void> getUserInfo() async {
    emit(GetUserInfoLoading());
    try {
      user = await ProfileRepo().getUserInfo();
      emit(GetUserInfoSuccess(user));
    } catch (e) {
      emit(GetUserInfoFailed(e.toString()));
    }
  }
}
