import 'package:e_learning/details_course/details_course.dart';
import 'package:e_learning/details_course/widgets/card_course.dart';
import 'package:e_learning/utilities/constants/list_provider.dart';
import 'package:flutter/material.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // return ListView.builder(
    //   itemCount: user.myCourses.length,
    //   itemBuilder: (context, index) {
    //     var course = user.myCourses[index];
    //     return InkWell(
    //       onTap: () => Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //           builder: (_) => CourseInfo(
    //             course: course,
    //           ),
    //         ),
    //       ),
    //       child: CardCourse(course: course),
    //     );
    //   },
    // );
    return Center(
      child: Text('Đợi api thay'),
    );
  }
}
