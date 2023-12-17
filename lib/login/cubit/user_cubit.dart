import 'package:bloc/bloc.dart';
import 'package:e_learning/authenticate/model/user_model.dart';

class UserCubit extends Cubit<User> {
  UserCubit() : super(User());

  void setUser(User user) {
    emit(user);
  }
}
