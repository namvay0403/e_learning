import 'package:e_learning/utilities/constants/constants.dart';

import '../../history/model/history_courses_model.dart';

class User {
  late String email;
  late String password;
  late String userName;
  late String avatar;
  late int totalHour;
  late int totalMinute;
  late List<HistoryCourses> historyCourses;

  User({
    this.email = "namvay0403@gmail.com",
    this.password = "123",
    this.userName = 'userName',
    this.avatar = 'assets/images/avatar.jpg',
    this.totalHour = 440,
    this.totalMinute = 50,
    required this.historyCourses,
  });
}
