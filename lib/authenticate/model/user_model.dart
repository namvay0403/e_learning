import 'package:e_learning/utilities/constants/constants.dart';

class User {
  late String email;
  late String password;
  late String userName;
  late String avatar;

  User(
      {this.email = "namvay0403@gmail.com",
      this.password = "123",
      this.userName = 'userName',
      this.avatar = 'assets/images/avatar.jpg'});
}
