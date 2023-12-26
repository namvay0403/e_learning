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
                child: CardCourse(
                    name: widget.course.name,
                    description: widget.course.description,
                    imageUrl: widget.course.imageUrl),
              ),
              sizedBox.mediumHeight(),
              const Header(text: 'Overview'),
              IntroCourse(
                what: widget.course.purpose,
                why: widget.course.reason,
              ),
              sizedBox.mediumHeight(),
              const Header(text: 'Experience Level'),
              Level(level: widget.course.level),
              sizedBox.mediumHeight(),
              const Header(text: 'Course Length'),
              CourseLength(lengthOfCourse: widget.course.topics.length),
              sizedBox.mediumHeight(),
              const Header(text: 'List Topic'),
              ListTopics(topics: widget.course.topics),
            ],
          ),
        ),
      ),
    );
  }
}
