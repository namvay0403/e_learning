import 'package:e_learning/courses/model/course_model.dart';
import 'package:flutter/material.dart';
import 'package:e_learning/utilities/constants/constants.dart';

class CardCourse extends StatelessWidget {
  const CardCourse({super.key, required this.course});
  final Course course;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: padding.medium, vertical: padding.medium),
      child: Container(
        width: size.width / 1.3,
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
          padding: const EdgeInsets.all(padding.large),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AppAssets.elearning),
              sizedBox.smallHeight(),
              Text(
                course.title,
                softWrap: true,
                style: textStyle.headerStyle(fontSize: 16),
              ),
              sizedBox.mediumHeight(),
              Text(
                course.description,
                style: textStyle.normalStyle(),
              ),
              sizedBox.largeHeight(),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  width: size.width - 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: colorProject.primaryColor,
                  ),
                  child: Text(
                    'DISCOVER',
                    style: textStyle.headerStyle(
                        color: Colors.white, fontSize: 16),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
