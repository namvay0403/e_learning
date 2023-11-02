import 'package:e_learning/details_course/views/course_info.dart';
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
    return Center(
        child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => const CourseInfo())),
          child: CardCourse(),
        );
      },
    ));
  }

  Widget CardCourse() {
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
          padding: const EdgeInsets.symmetric(horizontal: padding.large),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AppAssets.elearning),
              sizedBox.smallHeight(),
              Text(
                'Life in the internet age',
                softWrap: true,
                style: textStyle.headerStyle(fontSize: 16),
              ),
              sizedBox.mediumHeight(),
              Text(
                "Let's discuss how technology is changing the way we live",
                style: textStyle.normalStyle(),
              ),
              sizedBox.largeHeight(),
              Text(
                'Intermediate: 9 Lessons',
                style: textStyle.headerStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
