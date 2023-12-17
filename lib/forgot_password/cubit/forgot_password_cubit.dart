import 'package:bloc/bloc.dart';
import 'package:e_learning/utilities/constants/list_provider.dart';
import 'package:meta/meta.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordInitial());

  Future<void> fotgotPassword({required String email}) async {
    emit(ForgotPasswordLoading());
    try {
      var response = await authenticationRepo.forgotPassword(email: email);
      emit(ForgotPasswordSuccess(message: response.toString()));
    } catch (e) {
      emit(ForgotPasswordFailed(message: e.toString()));
    }
  }
}
