import 'package:e_learning/utilities/constants/constants.dart';
import 'package:flutter/material.dart';

class Level extends StatelessWidget {
  const Level({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: padding.large),
      child: Row(
        children: [
          const Icon(
            Icons.people,
            color: colorProject.primaryColor,
          ),
          sizedBox.largeWidth(),
          Text(
            'Immediate',
            style: textStyle.headerStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
