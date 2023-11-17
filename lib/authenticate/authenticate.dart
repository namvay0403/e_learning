import 'package:e_learning/authenticate/model/user_model.dart';

import '../utilities/constants/list_provider.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated, error }

class AuthenticationRepo {
  AuthenticationStatus login(
      {required String email, required String password}) {
    if (email == user.email && password == user.password) {
      return AuthenticationStatus.authenticated;
    } else {
      return AuthenticationStatus.unauthenticated;
    }
  }

  bool signUp({required String email, required String password}) {
    try {
      user.email = email;
      user.password = password;
      return true;
    } catch (e) {
      return false;
    }
  }

  bool forgotPassword({required String email}) {
    if (email == user.email) {
      user.password = '123';
      return true;
    }
    return false;
  }
}
