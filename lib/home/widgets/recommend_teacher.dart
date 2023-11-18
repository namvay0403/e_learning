import 'package:e_learning/detail_teacher/detail_teacher.dart';
import 'package:e_learning/filter/filter_teachers_cubit.dart';
import 'package:e_learning/teachers/cubit/favourite_teacher_cubit.dart';
import 'package:e_learning/teachers/model/teacher_model.dart';
import 'package:e_learning/utilities/constants/constants.dart';
import 'package:e_learning/utilities/constants/list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'card_filter.dart';

class RecommendTeacher extends StatefulWidget {
  const RecommendTeacher({super.key});

  @override
  State<RecommendTeacher> createState() => _RecommendTeacherState();
}

class _RecommendTeacherState extends State<RecommendTeacher> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterTeachersCubit, FilterTeachersState>(
      builder: (context, state) {
        if (state is FilterTeachersSuccess) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: filterListTeachers.length,
            itemBuilder: (context, index) {
              var teacher = filterListTeachers[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: padding.small),
                child: CardTeacher(teacher: teacher),
              );
            },
          );
        } else {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: teachers.length,
            itemBuilder: (context, index) {
              var teacher = teachers[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: padding.small),
                child: CardTeacher(teacher: teacher),
              );
            },
          );
        }
      },
    );
  }
}

class CardTeacher extends StatelessWidget {
  const CardTeacher({super.key, required this.teacher});

  final Teacher teacher;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteTeacherCubit, FavouriteTeacherState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Colors.grey.withOpacity(0.2)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: [
                        InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const DetailTeacherPage())),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(AppAssets.avatar),
                            radius: 40,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          const DetailTeacherPage())),
                              child: Text(
                                teacher.name,
                                style: const TextStyle(
                                  fontFamily: fontBoldApp,
                                  fontSize: fontSize.large,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(teacher.country),
                            Row(
                              children: [
                                Text('${teacher.rating}/5'),
                                Icon(Icons.star, color: Colors.yellow),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        context
                            .read<FavouriteTeacherCubit>()
                            .addFavouriteTeacher(id: teacher.id);
                      },
                      child: teacher.isFavourite
                          ? Icon(
                              Icons.favorite,
                              size: 35,
                              color: Colors.red,
                            )
                          : Icon(
                              Icons.favorite,
                              size: 35,
                            ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    for (var item in teacher.specialities)
                      CardCustom(text: item)
                  ],
                ),
                const SizedBox(height: 30),
                Text(
                  teacher.description,
                  softWrap: true,
                  style: const TextStyle(
                    fontFamily: fontApp,
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: colorProject.primaryColor,
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.list_alt_outlined,
                                color: colorProject.primaryColor),
                            Text(
                              'Book',
                              style: TextStyle(
                                color: colorProject.primaryColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
