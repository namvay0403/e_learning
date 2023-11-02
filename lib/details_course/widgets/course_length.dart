import 'package:flutter/material.dart';
import 'package:e_learning/utilities/constants/constants.dart';

class CourseLength extends StatelessWidget {
  const CourseLength({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: padding.large),
      child: Row(
        children: [
          const Icon(
            Icons.book,
            color: colorProject.primaryColor,
          ),
          sizedBox.largeWidth(),
          Text(
            '9 Topics',
            style: textStyle.headerStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
