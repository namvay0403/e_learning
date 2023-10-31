import 'package:e_learning/utilities/constants/constants.dart';
import 'package:flutter/material.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Course',
      style: textStyle.headerStyle(),
    );
  }
}
