import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_learning/forgot_password/views/forgot_password_page.dart';
import 'package:e_learning/login/cubit/login_cubit.dart';
import 'package:e_learning/signup/cubit/signup_cubit.dart';
import 'package:e_learning/signup/views/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/home.dart';
import '../../utilities/button/buttonCustom.dart';
import '../../utilities/constants/constants.dart';
import '../../utilities/textField/textFieldCustom.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.height * 0.03, vertical: size.width * 0.1),
          child: SingleChildScrollView(
            child: BlocListener<LoginCubit, LoginState>(
              listener: (context, state) {
                // TODO: implement listener
                if (state is LoginFailed) {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.error,
                    animType: AnimType.topSlide,
                    showCloseIcon: true,
                    title: "Error",
                    desc: "Invalid email or password",
                    btnOkOnPress: () {},
                  ).show();
                }
                if (state is LoginSuccess) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Say hello to your English tutors',
                    style: TextStyle(
                      color: colorProject.primaryColor,
                      fontSize: 30,
                      fontFamily: fontBoldApp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.2,
                    width: size.width,
                    child: Image.asset(AppAssets.elearning),
                  ),
                  const Text(
                    'Become fluent faster through one on one video chat lessons tailored to your goals.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: fontBoldApp,
                    ),
                  ),
                  Form(
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgotPasswordPage(),
                                ),
                              ),
                              child: Text(
                                'Forgot password?',
                                style: TextStyle(
                                    color: colorProject.primaryColor,
                                    fontSize: fontSize.textField,
                                    fontFamily: fontBoldApp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        ButtonApp(
                          label: 'LOG IN',
                          onPressed: () {
                            if (formKeyLogin.currentState!.validate()) {
                              context.read<LoginCubit>().login(
                                  email: emailController.text,
                                  password: passwordController.text);
                            }
                            // ;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Center(
                    child: Text(
                      'Or continue with',
                      style: TextStyle(
                        color: colorProject.smallTitle,
                        fontFamily: fontBoldApp,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      socialButton(assetString: AppAssets.google),
                      const SizedBox(width: 15),
                      socialButton(assetString: AppAssets.facebook),
                      const SizedBox(width: 15),
                      socialButton(assetString: AppAssets.phone),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
                          ),
                        );
                      },
                      child: Text.rich(
                        TextSpan(
                          text: 'Not a member yet? ',
                          style: Theme.of(context).textTheme.labelMedium,
                          children: const <InlineSpan>[
                            TextSpan(
                              text: 'Sign up',
                              style: TextStyle(
                                color: colorProject.primaryColor,
                                fontFamily: fontBoldApp,
                                fontWeight: FontWeight.bold,
                                fontSize: fontSize.textField,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Ink socialButton({required String assetString}) {
    return Ink(
      child: InkWell(
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blue,
            ),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Image.asset(
              assetString,
              height: 30,
              width: 30,
            ),
          ),
        ),
      ),
    );
  }
}
