import 'package:flutter/material.dart';

import '../../utilities/constants/constants.dart';

class FilterCourses extends StatefulWidget {
  const FilterCourses({super.key});

  @override
  State<FilterCourses> createState() => _FilterCoursesState();
}

class _FilterCoursesState extends State<FilterCourses> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: padding.large),
      child: Wrap(
        runAlignment: WrapAlignment.start,
        runSpacing: 10,
        spacing: 10,
        children: [
          SizedBox(
            height: 50,
            width: size.width / 2.3,
            child: TextFormField(
              style: const TextStyle(fontFamily: fontApp),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                suffixIcon: const Icon(Icons.keyboard_arrow_down_sharp),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.transparent,
                hintText: 'Select level',
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blueGrey),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: colorProject.primaryColor, width: 1.5),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
            width: size.width / 2.3,
            child: TextFormField(
              style: const TextStyle(fontFamily: fontApp),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                suffixIcon: const Icon(Icons.keyboard_arrow_down_sharp),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.transparent,
                hintText: 'Select category',
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blueGrey),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: colorProject.primaryColor, width: 1.5),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
            width: size.width / 2.3,
            child: TextFormField(
              style: const TextStyle(fontFamily: fontApp),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                suffixIcon: const Icon(Icons.keyboard_arrow_down_sharp),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.transparent,
                hintText: 'Sort by level',
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blueGrey),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: colorProject.primaryColor, width: 1.5),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
