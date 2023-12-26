import 'package:e_learning/courses/model/course_model.dart';
import 'package:e_learning/details_course/views/course_info.dart';
import 'package:e_learning/utilities/constants/constants.dart';
import 'package:e_learning/utilities/constants/list_provider.dart';
import 'package:flutter/material.dart';

class CoursePage extends StatefulWidget {
  CoursePage({super.key, required this.courses});

  final List<Course> courses;

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: widget.courses.length,
      itemBuilder: (context, index) {
        var course = widget.courses[index];
        return InkWell(
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (_) => CourseInfo(course: course))),
          child: CardCourse(course.name, course.description, course.imageUrl,
              course.level, course.topics.length),
        );
      },
    ));
  }

  Widget CardCourse(
      String name, String description, String image, String level, int lesson) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: padding.medium, vertical: padding.medium),
      child: Container(
        width: size.width / 1.5,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey, width: 0.25),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: padding.medium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(image),
              sizedBox.smallHeight(),
              Text(
                name,
                softWrap: true,
                style: textStyle.headerStyle(fontSize: 16),
              ),
              sizedBox.mediumHeight(),
              Text(
                description,
                style: textStyle.normalStyle(),
              ),
              sizedBox.largeHeight(),
              Text(
                'Level: ${level} - ${lesson} Lessons',
                style: textStyle.headerStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
