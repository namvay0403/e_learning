import 'package:flutter/material.dart';
import '../constants/constants.dart';

class ButtonApp extends StatefulWidget {
  const ButtonApp({super.key, required this.label, required this.onPressed});

  final String label;
  final void Function()? onPressed;

  @override
  State<ButtonApp> createState() => _ButtonAppState();
}

class _ButtonAppState extends State<ButtonApp> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed,
      style: TextButton.styleFrom(
        backgroundColor: colorProject.primaryColor,
      ),
      child: Text(
        widget.label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: fontSize.large,
          fontFamily: fontBoldApp,
        ),
      ),
    );
  }
}
