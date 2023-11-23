import 'package:e_learning/courses/model/course_model.dart';
import 'package:flutter/material.dart';
import 'package:e_learning/utilities/constants/constants.dart';

class CourseLength extends StatelessWidget {
  const CourseLength({super.key, required this.course});

  final Course course;

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
            '${course.numberOfLesson} Topics',
            style: textStyle.headerStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
