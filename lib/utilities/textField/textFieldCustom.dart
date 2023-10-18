import 'dart:ffi';

import 'package:flutter/material.dart';

import '../constants/constants.dart';

// ignore: must_be_immutable
class TextFieldApp extends StatefulWidget {
  TextFieldApp({
    super.key,
    required this.controller,
    required this.prefixIcon,
    required this.label,
    this.obsecure = true,
    this.validatorFunc,
    this.errorText,
    this.suffixIcon = false,
  });

  final TextEditingController controller;
  final IconData prefixIcon;
  final String label;
  final bool suffixIcon;
  bool obsecure;
  String? Function(String?)? validatorFunc;
  String? errorText;
  @override
  State<TextFieldApp> createState() => _TextFieldAppState();
}

class _TextFieldAppState extends State<TextFieldApp> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        fontFamily: fontApp,
      ),
      controller: widget.controller,
      obscureText: widget.obsecure,
      cursorColor: colorProject.primaryColor,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.transparent,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        prefixIcon: Icon(widget.prefixIcon, color: colorProject.primaryColor),
        suffixIcon: widget.suffixIcon
            ? InkWell(
                onTap: () {
                  setState(
                    () {
                      widget.obsecure = !widget.obsecure;
                    },
                  );
                },
                child: Icon(
                    widget.obsecure ? Icons.visibility : Icons.visibility_off),
              )
            : const SizedBox(height: 0, width: 0),
        labelText: widget.label,
        labelStyle: const TextStyle(
          color: colorProject.primaryColor,
          fontFamily: fontApp,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blueGrey),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: colorProject.primaryColor, width: 1.5),
          borderRadius: BorderRadius.circular(15),
        ),
        errorText: widget.errorText,
        errorStyle: const TextStyle(
          fontFamily: fontApp,
        ),
      ),
      validator: widget.validatorFunc,
    );
  }
}
