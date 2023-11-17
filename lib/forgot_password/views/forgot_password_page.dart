import 'package:e_learning/forgot_password/views/forgot_password_screen.dart';
import 'package:e_learning/utilities/constants/constants.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fotgot password',
          style: textStyle.headerStyle(),
        ),
        automaticallyImplyLeading: true,
      ),
      body: ForgotPasswordScreen(),
    );
  }
}
