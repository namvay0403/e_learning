import 'package:e_learning/authenticate/authenticate.dart';
import 'package:e_learning/authenticate/model/user_model.dart';
import 'package:e_learning/filter/filter_teachers_cubit.dart';
import 'package:e_learning/login/cubit/login_cubit.dart';
import 'package:e_learning/profile/cubits/update_avatar/update_profile_cubit.dart';
import 'package:e_learning/profile/cubits/update_profile/update_avatar_cubit.dart';
import 'package:e_learning/profile/repo/repo.dart';
import 'package:e_learning/signup/cubit/signup_cubit.dart';
import 'package:e_learning/teachers/cubit/favourite/favourite_teacher_cubit.dart';
import 'package:e_learning/teachers/cubit/get_teacher_by_id/get_teacher_by_id_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../courses/model/course_model.dart';
import '../../forgot_password/cubit/forgot_password_cubit.dart';
import '../../history/model/history_courses_model.dart';
import '../../login/cubit/user_cubit.dart';
import '../../teachers/cubit/get_teachers/get_teachers_cubit.dart';
import '../../teachers/model/teacher_model.dart';
import 'constants.dart';

AuthenticationRepo authenticationRepo = AuthenticationRepo();
User user = User();
ChangeProfile changeProfile = ChangeProfile();

List<Teacher> filterListTeachers = [];

List<Teacher> teachers = [];

final List<Course> courses = [
  Course(
      'Life in the Internet Age',
      "Let's discuss how technology is changing the way we live",
      'Advanced',
      "You will learn vocabulary related to timely topics like remote work, artificial intelligence, online privacy, and more. In addition to discussion questions, you will practice intermediate level speaking tasks such as using data to describe trends.",
      "Our world is rapidly changing thanks to new technology, and the vocabulary needed to discuss modern life is evolving almost daily. In this course you will learn the most up-to-date terminology from expertly crafted lessons as well from your native-speaking tutor.",
      4,
      ['Topic 1', 'Topic 2', 'Topic 3', 'Topic 4']),
  Course(
      'Caring for Our Planet',
      "Let's discuss our relationship as humans with our planet, Earth",
      'Intermediate',
      "This course covers intermediate level vocabulary related to sustainability and environmental science. In addition, you will complete technical tasks such as describing charts, analyzing data, and making estimations.",
      "As climate change and environmentalism become increasingly global issues, this topic appears often in international news and is relevant to many international industries.",
      3,
      ['Topic 1', 'Topic 2', 'Topic 3']),
  Course(
      'Healthy Mind, Healthy Body',
      "Let's discuss the many aspects of living a long, happy life",
      'Intermediate',
      "Discuss topics related to physical, mental, and emotional health. Learn about other cultures along the way in friendly conversations with tutors.",
      "",
      4,
      ['Topic 1', 'Topic 2', 'Topic 3', 'Topic 4']),
];

DateTime now = DateTime.now();

final List<HistoryCourses> historyCourses = [
  HistoryCourses(
    DateTime(now.year, now.month, now.day),
    10,
    1,
    DateTime(now.year, now.month, now.day, now.hour + 1, 30),
    DateTime(now.year, now.month, now.day, now.hour + 2, 30),
    "",
    "",
  ),
  HistoryCourses(
    DateTime(now.year, now.month, now.day),
    10,
    2,
    DateTime(now.year, now.month, now.day, now.hour + 1, 30),
    DateTime(now.year, now.month, now.day, now.hour + 2, 30),
    "",
    "5/5",
  ),
  HistoryCourses(
    DateTime(now.year, now.month, now.day),
    10,
    3,
    DateTime(now.year, now.month, now.day, now.hour + 1, 30),
    DateTime(now.year, now.month, now.day, now.hour + 2, 30),
    "Oke",
    "3.5/5",
  ),
  HistoryCourses(
    DateTime(now.year, now.month, now.day),
    10,
    5,
    DateTime(now.year, now.month, now.day, now.hour + 1, 30),
    DateTime(now.year, now.month, now.day, now.hour + 2, 30),
    "Oke",
    "3.5/5",
  ),
];

final listProvider = [
  BlocProvider<UserCubit>(
    create: (_) => UserCubit(),
  ),
  BlocProvider<SignupCubit>(
    create: (_) =>
        SignupCubit(authenticationRepo: authenticationRepo, user: user),
  ),
  BlocProvider<LoginCubit>(
    create: (_) => LoginCubit(authenticationRepository: AuthenticationRepo()),
  ),
  BlocProvider<ForgotPasswordCubit>(
    create: (_) => ForgotPasswordCubit(),
  ),
  BlocProvider<FavouriteTeacherCubit>(
    create: (_) => FavouriteTeacherCubit(),
  ),
  BlocProvider<FilterTeachersCubit>(
    create: (_) => FilterTeachersCubit(),
  ),
  BlocProvider<UpdateProfileCubit>(
    create: (_) => UpdateProfileCubit(changeProfile: changeProfile),
  ),
  BlocProvider<UpdateAvatarCubit>(
    create: (_) => UpdateAvatarCubit(changeProfile: changeProfile),
  ),

  // get teachers
  BlocProvider<GetTeachersCubit>(
    create: (_) => GetTeachersCubit(),
  ),
  // get teacher by id
  BlocProvider<GetTeacherByIdCubit>(
    create: (_) => GetTeacherByIdCubit(),
  ),
];
