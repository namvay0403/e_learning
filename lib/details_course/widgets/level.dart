import 'package:e_learning/courses/model/course_model.dart';
import 'package:e_learning/utilities/constants/constants.dart';
import 'package:flutter/material.dart';

class Level extends StatelessWidget {
  const Level({super.key, required this.level});
  final String level;

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
            level,
            style: textStyle.headerStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
