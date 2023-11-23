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

import '../../forgot_password/cubit/forgot_password_cubit.dart';
import '../../teachers/model/teacher_model.dart';
import 'constants.dart';

AuthenticationRepo authenticationRepo = AuthenticationRepo();
User user = User();

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
