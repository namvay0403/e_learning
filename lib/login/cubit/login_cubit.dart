import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../authenticate/authenticate.dart';
import '../../authenticate/model/user_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authenticationRepo, required this.user})
      : super(LoginInitial());

  final AuthenticationRepo authenticationRepo;
  final User user;

  void login({required String email, required String password}) {
    var result = authenticationRepo.login(email: email, password: password);

    if (result == AuthenticationStatus.authenticated) {
      emit(LoginSuccess(result: result));
      print('test ở login cubit: ${result}');
    } else if (result == AuthenticationStatus.unauthenticated) {
      emit(LoginFailed(error: result));
      print('test ở login cubit: ${result}');
    }
  }
}
