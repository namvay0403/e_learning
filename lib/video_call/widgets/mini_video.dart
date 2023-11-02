import 'package:e_learning/utilities/constants/constants.dart';
import 'package:flutter/material.dart';

class MiniVideo extends StatelessWidget {
  const MiniVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(padding.large),
      child: SizedBox(
        height: 150,
        width: 120,
        child: Image.asset(AppAssets.avatar),
      ),
    );
  }
}
