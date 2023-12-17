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

  Future<void> signUp({required String email, required String password}) async {
    try {
      emit(SignupLoading());
      var reponse =
          await authenticationRepo.signUp(email: email, password: password);
      emit(SignupSuccess(message: reponse));
    } catch (e) {
      emit(SignupFailed(error: e.toString()));
    }
  }
}
