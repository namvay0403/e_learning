import 'package:e_learning/filter/filter_teachers_cubit.dart';
import 'package:e_learning/teachers/cubit/favourite_teacher_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utilities/constants/constants.dart';

class CardFilter extends StatelessWidget {
  const CardFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            CardCustom(text: 'All'),
            CardCustom(text: 'English for kids'),
            CardCustom(text: 'English for business'),
            CardCustom(text: 'Conservation'),
            CardCustom(text: 'STARTERS'),
            CardCustom(text: 'MOVERS'),
            CardCustom(text: 'FLYERS'),
            CardCustom(text: 'KET'),
            CardCustom(text: 'PET'),
            CardCustom(text: 'IELTS'),
            CardCustom(text: 'TOEPL'),
            CardCustom(text: 'TOEIC'),
          ],
        ),
        const SizedBox(height: 10),
        ElevatedButton(
            onPressed: () {
              context.read<FilterTeachersCubit>().resetFilter();
            },
            child: const Text('Reset Filters')),
      ],
    );
  }
}

class CardCustom extends StatelessWidget {
  const CardCustom({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<FilterTeachersCubit, FilterTeachersState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: const Color(0xC4BFBFE0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: InkWell(
              onTap: () {
                context.read<FilterTeachersCubit>().filter(specific: text);
              },
              child: Text(
                text,
                style: const TextStyle(
                  fontFamily: fontApp,
                  fontSize: fontSize.medium,
                  color: colorProject.primaryColor,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
