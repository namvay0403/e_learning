import 'package:e_learning/detail_teacher/detail_teacher.dart';
import 'package:e_learning/filter/filter_teachers_cubit.dart';
import 'package:e_learning/teachers/cubit/favourite/favourite_teacher_cubit.dart';
import 'package:e_learning/teachers/model/teacher_model.dart';
import 'package:e_learning/utilities/constants/constants.dart';
import 'package:e_learning/utilities/constants/list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../teachers/cubit/get_teachers/get_teachers_cubit.dart';
import 'card_filter.dart';

class RecommendTeacher extends StatefulWidget {
  const RecommendTeacher({super.key});

  @override
  State<RecommendTeacher> createState() => _RecommendTeacherState();
}

class _RecommendTeacherState extends State<RecommendTeacher> {
  String pageNumber = '1';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<GetTeachersCubit>().getTeachers(pageNumber);
  }

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
                child: CardTeacher(teacher: teacher, pageNumber: pageNumber),
              );
            },
          );
        } else {
          return BlocBuilder<GetTeachersCubit, GetTeachersState>(
            builder: (context, state) {
              if (state is GetTeachersLoading) {
                Center(
                  child: CircularProgressIndicator(
                    color: colorProject.primaryColor,
                  ),
                );
              }
              if (state is GetTeachersLoaded) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: teachers.length,
                      itemBuilder: (context, index) {
                        var teacher = teachers[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: padding.small),
                          child: CardTeacher(
                              teacher: teacher, pageNumber: pageNumber),
                        );
                      },
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        itemCount: 5,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Center(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  pageNumber = (index + 1).toString();
                                  context
                                      .read<GetTeachersCubit>()
                                      .getTeachers(pageNumber);
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color:
                                          pageNumber == (index + 1).toString()
                                              ? Colors.red
                                              : Colors.grey.withOpacity(0.2),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 4),
                                    child: Text(
                                      (index + 1).toString(),
                                      style: TextStyle(
                                        color:
                                            pageNumber == (index + 1).toString()
                                                ? Colors.red
                                                : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                );
              }
              if (state is GetTeachersFailed) {
                return Center(
                  child: Text(state.message),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );
        }
      },
    );
  }
}

class CardTeacher extends StatelessWidget {
  const CardTeacher(
      {super.key, required this.teacher, required this.pageNumber});

  final Teacher teacher;
  final String pageNumber;

  @override
  Widget build(BuildContext context) {
    var check = teachers.where((teacher) => teacher.isFavoriteTutor);
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
                                builder: (_) =>
                                    DetailTeacherPage(teacher: teacher))),
                        child: teacher.avatar.isEmpty
                            ? CircleAvatar(
                                backgroundImage: AssetImage(AppAssets.avatar),
                                radius: 40,
                              )
                            : CircleAvatar(
                                backgroundImage: NetworkImage(teacher.avatar),
                                radius: 40,
                              )),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        DetailTeacherPage(teacher: teacher))),
                            child: Text(
                              teacher.name,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontFamily: fontBoldApp,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Text('${teacher.country}'),
                        Row(
                          children: [
                            teacher.rating != null
                                ? Text('${teacher.rating.toStringAsFixed(0)}/5')
                                : Text('1/5'),
                            Icon(Icons.star, color: Colors.yellow),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    context.read<GetTeachersCubit>().addFavouriteTeacher(
                        id: teacher.id, pageNumber: pageNumber);
                    print(teacher.isFavoriteTutor);
                  },
                  child: teacher.isFavoriteTutor != null
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
            Text('${teacher.specialties}'),
            const SizedBox(height: 30),
            Text(
              teacher.bio.toString(),
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
  }
}
