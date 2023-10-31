import 'package:e_learning/utilities/constants/constants.dart';
import 'package:flutter/material.dart';

import '../widgets/filter_courses.dart';
import '../widgets/intro.dart';
import '../widgets/pages_view.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntroCourses(),
          sizedBox.largeHeight(),
          FilterCourses(),
          sizedBox.largeHeight(),
          PagesView(),
          sizedBox.largeHeight(),
        ],
      ),
    );
  }
}
