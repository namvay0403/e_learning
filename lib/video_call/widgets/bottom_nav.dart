import 'package:e_learning/utilities/constants/constants.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        iconMicro(),
        iconCall(),
        iconVideoCall(),
      ],
    );
  }

  Widget iconMicro() {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: 30, horizontal: padding.small),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black12,
          shape: BoxShape.circle,
        ),
        child: const Padding(
          padding: EdgeInsets.all(padding.large),
          child: Icon(
            Icons.mic_rounded,
          ),
        ),
      ),
    );
  }

  Widget iconCall() {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: 30, horizontal: padding.small),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        child: const Padding(
          padding: EdgeInsets.all(padding.large),
          child: Icon(
            Icons.call_end,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget iconVideoCall() {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: 30, horizontal: padding.small),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black12,
          shape: BoxShape.circle,
        ),
        child: const Padding(
          padding: EdgeInsets.all(padding.large),
          child: Icon(
            Icons.camera_alt,
          ),
        ),
      ),
    );
  }
}
