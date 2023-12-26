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

import '../../courses/cubit/get_courses/get_courses_cubit.dart';
import '../../courses/model/course_model.dart';
import '../../detail_teacher/cubit/get_reviews/get_reviews_cubit.dart';
import '../../forgot_password/cubit/forgot_password_cubit.dart';
import '../../history/model/history_courses_model.dart';
import '../../login/cubit/user_cubit.dart';
import '../../schedule/cubit/get_schedules_cubit.dart';
import '../../teachers/cubit/get_teachers/get_teachers_cubit.dart';
import '../../teachers/model/teacher_model.dart';
import 'constants.dart';

AuthenticationRepo authenticationRepo = AuthenticationRepo();
User user = User();
ChangeProfile changeProfile = ChangeProfile();

List<Teacher> filterListTeachers = [];

List<Teacher> teachers = [];

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

  // get schedules
  BlocProvider<GetSchedulesCubit>(
    create: (_) => GetSchedulesCubit(),
  ),

  // get reviews
  BlocProvider<GetReviewsCubit>(
    create: (_) => GetReviewsCubit(),
  ),

  // get courses
  BlocProvider<GetCoursesCubit>(
    create: (_) => GetCoursesCubit(),
  ),
];
