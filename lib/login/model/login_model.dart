import 'package:e_learning/authenticate/model/user_model.dart';

import '../../authenticate/authenticate.dart';

class LoginModel {
  AuthenticationStatus status;
  User? user;

  LoginModel({required this.status, this.user});
}
