import 'package:e_learning/authenticate/authenticate.dart';
import 'package:e_learning/authenticate/cubit/user_cubit.dart';
import 'package:e_learning/authenticate/model/user_model.dart';
import 'package:e_learning/login/cubit/login_cubit.dart';
import 'package:e_learning/signup/cubit/signup_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../forgot_password/cubit/forgot_password_cubit.dart';

AuthenticationRepo authenticationRepo = AuthenticationRepo();
User user = User();

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
];
