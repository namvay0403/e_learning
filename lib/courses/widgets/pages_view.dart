import 'package:e_learning/courses/widgets/course_page.dart';
import 'package:e_learning/courses/widgets/ebook_page.dart';
import 'package:e_learning/courses/widgets/interactive_EBook.dart';
import 'package:e_learning/utilities/constants/constants.dart';
import 'package:flutter/material.dart';

import '../model/course_model.dart';

class PagesView extends StatefulWidget {
  const PagesView({super.key, required this.courses});

  final List<Course> courses;

  @override
  State<PagesView> createState() => _PagesViewState();
}

class _PagesViewState extends State<PagesView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      CoursePage(courses: widget.courses),
      const EbookPage(),
      const InteractiveEBookPage(),
    ];
    TabController _tabController = TabController(length: 3, vsync: this);
    return Column(
      children: [
        Container(
          child: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              indicatorColor: colorProject.primaryColor,
              controller: _tabController,
              isScrollable: true,
              labelStyle: textStyle.headerStyle(fontSize: 14),
              labelPadding: const EdgeInsets.only(
                  left: padding.medium, right: padding.large),
              tabs: const [
                Tab(
                  text: 'Course',
                ),
                Tab(
                  text: 'E-book',
                ),
                Tab(
                  text: 'Interactive E-book',
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.maxFinite,
          height: 370,
          child: TabBarView(
            controller: _tabController,
            children: [
              Container(
                child: pages[0],
              ),
              Container(
                child: pages[1],
              ),
              Container(
                child: pages[2],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
