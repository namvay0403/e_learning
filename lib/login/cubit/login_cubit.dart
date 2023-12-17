import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../authenticate/authenticate.dart';
import '../../authenticate/model/user_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authenticationRepository}) : super(LoginInitial());

  final AuthenticationRepo authenticationRepository;

  Future<void> logIn(
      {required String username, required String password}) async {
    emit(LoginLoading());
    try {
      print('Loading');
      var res = await authenticationRepository.logIn(
          username: username, password: password);
      if (res.status == AuthenticationStatus.authenticated) {
        emit(LoginSuccess(statusLogin: res.status.toString(), user: res.user!));
      } else {
        emit(LoginFailure(error: "Tài khoản hoặc mật khẩu không đúng"));
      }
    } catch (e) {
      emit(LoginFailure(error: e.toString()));
    }
  }

  Future<void> setInit() async {
    emit(LoginInitial());
  }
}
