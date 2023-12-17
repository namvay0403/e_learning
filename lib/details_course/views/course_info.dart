import 'package:e_learning/details_course/widgets/intro_course.dart';
import 'package:e_learning/utilities/constants/constants.dart';
import 'package:e_learning/utilities/constants/list_provider.dart';
import 'package:flutter/material.dart';

import '../../courses/model/course_model.dart';
import '../widgets/card_course.dart';
import '../widgets/course_length.dart';
import '../widgets/header.dart';
import '../widgets/level.dart';
import '../widgets/suggest_tutor.dart';
import '../widgets/topics.dart';

class CourseInfo extends StatefulWidget {
  const CourseInfo({super.key, required this.course});

  final Course course;

  @override
  State<CourseInfo> createState() => _CourseInfoState();
}

class _CourseInfoState extends State<CourseInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: padding.medium),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: CardCourse(course: widget.course),
              ),
              sizedBox.mediumHeight(),
              const Header(text: 'Overview'),
              IntroCourse(course: widget.course),
              sizedBox.mediumHeight(),
              const Header(text: 'Experience Level'),
              Level(course: widget.course),
              sizedBox.mediumHeight(),
              const Header(text: 'Course Length'),
              CourseLength(course: widget.course),
              sizedBox.mediumHeight(),
              const Header(text: 'List Topic'),
              ListTopics(course: widget.course),
            ],
          ),
        ),
      ),
    );
  }
}
