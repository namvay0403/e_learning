import 'package:bloc/bloc.dart';
import 'package:e_learning/authenticate/authenticate.dart';
import 'package:e_learning/authenticate/model/user_model.dart';
import 'package:e_learning/utilities/constants/constants.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({required this.authenticationRepo, required this.user})
      : super(SignupInitial());

  final AuthenticationRepo authenticationRepo;
  final User user;

  bool signUp({required String email, required String password}) {
    try {
      user.email = email;
      user.password = password;
      emit(SignupSuccess(user: user));
      print('test ở signup cubit: ${user.email + user.password}');
      return true;
    } catch (e) {
      emit(SignupFailed(error: "Không hợp lệ"));
      return false;
    }
  }
}
