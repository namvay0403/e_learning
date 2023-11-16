import 'package:bloc/bloc.dart';
import 'package:e_learning/authenticate/authenticate.dart';
import 'package:e_learning/authenticate/model/user_model.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit({required this.authenticationRepo, required this.user})
      : super(UserInitial());

  final AuthenticationRepo authenticationRepo;
  final User user;
}
