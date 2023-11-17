import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_learning/login/login.dart';
import 'package:e_learning/signup/cubit/signup_cubit.dart';
import 'package:e_learning/signup/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utilities/button/buttonCustom.dart';
import '../../utilities/constants/constants.dart';
import '../../utilities/textField/textFieldCustom.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKeyLogin = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupLoading || state is SignupInitial) {
          const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is SignupFailed) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.topSlide,
            showCloseIcon: true,
            title: "Error",
            desc: state.error.toString(),
            btnOkOnPress: () {},
          ).show();
        }
        if (state is SignupSuccess) {
          Navigator.pop(context);
        }
      },
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(padding.medium),
          child: Form(
            key: formKeyLogin,
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: <Widget>[
                SizedBox(
                  height: 80,
                  child: TextFieldApp(
                    controller: emailController,
                    label: 'Email',
                    obsecure: false,
                    suffixIcon: false,
                    prefixIcon: Icons.email,
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
                SizedBox(
                  height: 80,
                  child: TextFieldApp(
                    controller: passwordController,
                    label: 'Password',
                    prefixIcon: Icons.password,
                    obsecure: true,
                    suffixIcon: true,
                    validatorFunc: (input) {
                      if (input!.isEmpty) {
                        return 'Not empty';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 8),
                ButtonApp(
                  label: 'SIGN UP',
                  onPressed: () async {
                    if (formKeyLogin.currentState!.validate()) {
                      await context.read<SignupCubit>().signUp(
                          email: emailController.text,
                          password: passwordController.text);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
