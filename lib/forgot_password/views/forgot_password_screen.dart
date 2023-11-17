import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_learning/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:e_learning/utilities/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utilities/button/buttonCustom.dart';
import '../../utilities/textField/textFieldCustom.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  final formKeyForgotPasword = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(padding.medium),
      child: Center(
        child: SingleChildScrollView(
          child: BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
            listener: (context, state) {
              // TODO: implement listener
              if (state is ForgotPasswordLoading ||
                  state is ForgotPasswordInitial) {
                Center(child: CircularProgressIndicator());
              }
              if (state is ForgotPasswordFailed) {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.error,
                  animType: AnimType.topSlide,
                  showCloseIcon: true,
                  title: "Error",
                  desc: "Email is not existed",
                  btnOkOnPress: () {},
                ).show();
              }
              if (state is ForgotPasswordSuccess) {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.success,
                  animType: AnimType.topSlide,
                  showCloseIcon: true,
                  title: "Success",
                  desc: "Password reset",
                  btnOkOnPress: () {},
                ).show();
              }
            },
            child: Form(
              key: formKeyForgotPasword,
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                    child: TextFieldApp(
                      controller: emailController,
                      label: 'Email',
                      prefixIcon: Icons.email,
                      obsecure: false,
                      validatorFunc: (input) {
                        if (input!.isEmpty) {
                          return 'Not empty';
                        } else if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(input)) {
                          return 'Invalid format';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  ButtonApp(
                    label: 'FORGOT PASSWORD',
                    onPressed: () {
                      if (formKeyForgotPasword.currentState!.validate()) {
                        context
                            .read<ForgotPasswordCubit>()
                            .fotgotPassword(email: emailController.text);
                      }
                      // ;
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
