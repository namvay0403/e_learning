import 'package:e_learning/courses/widgets/course_page.dart';
import 'package:e_learning/courses/widgets/ebook_page.dart';
import 'package:e_learning/courses/widgets/interactive_EBook.dart';
import 'package:e_learning/utilities/constants/constants.dart';
import 'package:flutter/material.dart';

class PagesView extends StatefulWidget {
  const PagesView({super.key});

  @override
  State<PagesView> createState() => _PagesViewState();
}

class _PagesViewState extends State<PagesView> {
  final PageController _pageController = PageController(initialPage: 0);

  int _activePage = 0;

  final List<Widget> _pages = [
    const CoursePage(),
    const EbookPage(),
    const InteractiveEBookPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: padding.large),
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  Text(
                    'Course',
                    style: textStyle.headerStyle(fontSize: 16),
                  ),
                  sizedBox.largeWidth(),
                  Text(
                    'E-Book',
                    style: textStyle.headerStyle(fontSize: 16),
                  ),
                  sizedBox.largeWidth(),
                  Text(
                    'Interactive E-book',
                    style: textStyle.headerStyle(fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
          const Divider(color: Colors.black12),
          CardCourse(),
          CardCourse(),
          CardCourse(),
        ],
      ),
    );
  }

  Widget CardCourse() {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: padding.medium),
      child: Container(
        width: size.width / 1.5,
        height: 350,
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
