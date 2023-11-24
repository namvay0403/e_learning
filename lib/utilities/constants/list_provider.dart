import 'package:e_learning/authenticate/authenticate.dart';
import 'package:e_learning/authenticate/cubit/user_cubit.dart';
import 'package:e_learning/authenticate/model/user_model.dart';
import 'package:e_learning/filter/filter_teachers_cubit.dart';
import 'package:e_learning/login/cubit/login_cubit.dart';
import 'package:e_learning/profile/cubits/update_avatar/update_profile_cubit.dart';
import 'package:e_learning/profile/cubits/update_profile/update_avatar_cubit.dart';
import 'package:e_learning/profile/repo/repo.dart';
import 'package:e_learning/signup/cubit/signup_cubit.dart';
import 'package:e_learning/teachers/cubit/favourite_teacher_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../courses/model/course_model.dart';
import '../../forgot_password/cubit/forgot_password_cubit.dart';
import '../../history/model/history_courses_model.dart';
import '../../teachers/model/teacher_model.dart';
import 'constants.dart';

AuthenticationRepo authenticationRepo = AuthenticationRepo();
User user = User(historyCourses: historyCourses, myCourses: courses);

ChangeProfile changeProfile = ChangeProfile();

List<Teacher> filterListTeachers = [];

final List<Teacher> teachers = [
  Teacher(
    0,
    'Nam',
    'VN',
    4.0,
    false,
    ['IELTS', 'PET', 'KET', 'TOEFL'],
    'Hello! My name is April Baldo, you can just call me Teacher April. I am an English teacher and currently teaching in senior high school. I have been teaching grammar and literature for almost 10 years. I am fond of reading and teaching literature....',
    AppAssets.avatar,
  ),
  Teacher(
    1,
    'Nam 1',
    'VN',
    3.5,
    false,
    ['IELTS', 'English for kids'],
    'Hello! My name is April Baldo, you can just call me Teacher April. I am an English teacher and currently teaching in senior high school. I have been teaching grammar and literature for almost 10 years. I am fond of reading and teaching literature....',
    AppAssets.avatar,
  ),
  Teacher(
    2,
    'Nam 2',
    'VN',
    5.0,
    true,
    ['IELTS', 'PET', 'English for Business'],
    'Hello! My name is April Baldo, you can just call me Teacher April. I am an English teacher and currently teaching in senior high school. I have been teaching grammar and literature for almost 10 years. I am fond of reading and teaching literature....',
    AppAssets.avatar,
  ),
  Teacher(
    3,
    'Nam 3',
    'VN',
    4.5,
    true,
    ['IELTS', 'PET', 'MOVERS'],
    'Hello! My name is April Baldo, you can just call me Teacher April. I am an English teacher and currently teaching in senior high school. I have been teaching grammar and literature for almost 10 years. I am fond of reading and teaching literature....',
    AppAssets.avatar,
  ),
  Teacher(
    4,
    'Nam 4',
    'VN',
    2,
    true,
    ['IELTS', 'PET', 'KET'],
    'Hello! My name is April Baldo, you can just call me Teacher April. I am an English teacher and currently teaching in senior high school. I have been teaching grammar and literature for almost 10 years. I am fond of reading and teaching literature....',
    AppAssets.avatar,
  ),
  Teacher(
    5,
    'Nam 5',
    'VN',
    3.5,
    true,
    ['IELTS', 'PET', 'FLYERS'],
    'Hello! My name is April Baldo, you can just call me Teacher April. I am an English teacher and currently teaching in senior high school. I have been teaching grammar and literature for almost 10 years. I am fond of reading and teaching literature....',
    AppAssets.avatar,
  ),
  Teacher(
    6,
    'Nam 6',
    'VN',
    1.5,
    false,
    ['IELTS', 'PET', 'KET'],
    'Hello! My name is April Baldo, you can just call me Teacher April. I am an English teacher and currently teaching in senior high school. I have been teaching grammar and literature for almost 10 years. I am fond of reading and teaching literature....',
    AppAssets.avatar,
  ),
];

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
    create: (_) =>
        UserCubit(authenticationRepo: authenticationRepo, user: user),
  ),
  BlocProvider<SignupCubit>(
    create: (_) =>
        SignupCubit(authenticationRepo: authenticationRepo, user: user),
  ),
  BlocProvider<LoginCubit>(
    create: (_) =>
        LoginCubit(authenticationRepo: authenticationRepo, user: user),
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
];
