import 'package:e_learning/courses/widgets/course_details_widgets/intro_course.dart';
import 'package:e_learning/utilities/constants/constants.dart';
import 'package:flutter/material.dart';

import '../widgets/course_details_widgets/card_course.dart';
import '../widgets/course_details_widgets/course_length.dart';
import '../widgets/course_details_widgets/header.dart';
import '../widgets/course_details_widgets/level.dart';
import '../widgets/course_details_widgets/suggest_tutor.dart';
import '../widgets/course_details_widgets/topics.dart';

class CourseInfo extends StatefulWidget {
  const CourseInfo({super.key});

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
              const Align(
                alignment: Alignment.center,
                child: CardCourse(),
              ),
              sizedBox.mediumHeight(),
              const Header(text: 'Overview'),
              const IntroCourse(),
              sizedBox.mediumHeight(),
              const Header(text: 'Experience Level'),
              const Level(),
              sizedBox.mediumHeight(),
              const Header(text: 'Course Length'),
              const CourseLength(),
              sizedBox.mediumHeight(),
              const Header(text: 'List Topic'),
              const ListTopics(),
              sizedBox.mediumHeight(),
              const Header(text: 'Suggested Tutors'),
              SuggestTutor(),
            ],
          ),
        ),
      ),
    );
  }
}
