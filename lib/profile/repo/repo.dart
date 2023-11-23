import 'package:e_learning/authenticate/model/user_model.dart';

import '../../utilities/constants/list_provider.dart';

class ChangeProfile {
  bool UpdateInfo({required User newUser}) {
    user.userName = newUser.userName;
    return true;
  }

  bool ChangeAvatar({required String newAvatar}) {
    user.avatar = newAvatar;
    return true;
  }
}