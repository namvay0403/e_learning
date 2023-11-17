import 'package:bloc/bloc.dart';
import 'package:e_learning/utilities/constants/list_provider.dart';
import 'package:meta/meta.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordInitial());

  void fotgotPassword({required String email}) {
    var result = authenticationRepo.forgotPassword(email: email);
    if (result == true) {
      emit(ForgotPasswordSuccess());
    } else {
      emit(ForgotPasswordFailed());
    }
  }
}
