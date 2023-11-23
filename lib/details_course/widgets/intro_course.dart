import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:e_learning/utilities/constants/constants.dart';

import '../../courses/model/course_model.dart';

class IntroCourse extends StatelessWidget {
  const IntroCourse({super.key, required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(
              Icons.question_mark,
              color: Colors.red,
            ),
            sizedBox.mediumHeight(),
            Text(
              'Why take this course',
              style: textStyle.headerStyle(fontSize: 16),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: padding.medium),
          child: Text(course.why),
        ),
        sizedBox.largeHeight(),
        Row(
          children: [
            const Icon(
              Icons.question_mark,
              color: Colors.red,
            ),
            sizedBox.mediumHeight(),
            Text(
              'What will you be able to do',
              style: textStyle.headerStyle(fontSize: 16),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: padding.medium),
          child: Text(course.what),
        ),
      ],
    );
  }
}
