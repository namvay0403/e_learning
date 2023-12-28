import 'package:e_learning/utilities/constants/list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utilities/constants/constants.dart';
import '../cubit/filter_courses/filter_courses_cubit.dart';

class IntroCourses extends StatefulWidget {
  const IntroCourses({super.key});

  @override
  State<IntroCourses> createState() => _IntroCoursesState();
}

class _IntroCoursesState extends State<IntroCourses> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    TextEditingController searchController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: padding.large),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Image.asset(AppAssets.courses),
              ),
              sizedBox.mediumWidth(),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Discover Courses',
                      style: textStyle.headerStyle(),
                    ),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        style: const TextStyle(fontFamily: fontApp),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          suffixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: Colors.transparent,
                          hintText: 'Course',
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.blueGrey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: colorProject.primaryColor, width: 1.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onChanged: (text) {
                          text = text.toLowerCase();
                          setState(() {
                            context.read<FilterCoursesCubit>().filter(text);
                            print('Test Find: ${filterCourses.length}');
                          });
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Text(
            'LiveTutor has built the most quality, methodical and scientific courses in the fields of life for those who are in need of improving their knowledge of the fields.',
            style: textStyle.normalStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
