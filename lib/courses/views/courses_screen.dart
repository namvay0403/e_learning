import 'package:e_learning/courses/cubit/filter_courses/filter_courses_cubit.dart';
import 'package:e_learning/courses/cubit/get_courses/get_courses_cubit.dart';
import 'package:e_learning/utilities/constants/constants.dart';
import 'package:flutter/material.dart';

import 'package:e_learning/utilities/constants/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<GetCoursesCubit>().getCourses();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        child: Column(
          children: [
            const IntroCourses(),
            sizedBox.mediumHeight(),
            const FilterCourses(),
            sizedBox.mediumHeight(),
            BlocBuilder<FilterCoursesCubit, FilterCoursesState>(
              builder: (context, state) {
                if (state is FilterCoursesLoaded) {
                  if (state.courses.length == 0) {
                    return const Center(
                      child: Text('No courses found'),
                    );
                  }
                  return PagesView(courses: state.courses);
                } else {
                  return BlocBuilder<GetCoursesCubit, GetCoursesState>(
                    builder: (context, state) {
                      if (state is GetCoursesLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is GetCoursesLoaded) {
                        return PagesView(courses: state.courses);
                      } else if (state is GetCoursesFailed) {
                        return Center(
                          child: Text(state.message),
                        );
                      }
                      return Container();
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
