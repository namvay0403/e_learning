import 'package:e_learning/filter/filter_teachers_cubit.dart';
import 'package:e_learning/utilities/constants/list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utilities/constants/constants.dart';

class FindATutor extends StatefulWidget {
  const FindATutor({super.key});

  @override
  State<FindATutor> createState() => _FindATutorState();
}

class _FindATutorState extends State<FindATutor> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: TextFormField(
            style: TextStyle(fontFamily: fontApp),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(padding.medium),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              filled: true,
              fillColor: Colors.transparent,
              hintText: 'Enter tutor name',
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: colorProject.primaryColor, width: 1.5),
                borderRadius: BorderRadius.circular(15),
              ),
              prefixIcon: Icon(Icons.search, color: colorProject.primaryColor),
            ),
            onChanged: (text) {
              text = text.toLowerCase();
              setState(() {
                context.read<FilterTeachersCubit>().find(text: text);
                print('Test Find: ${filterListTeachers.length}');
              });
            },
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 50,
          child: TextFormField(
            style: const TextStyle(fontFamily: fontApp),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(padding.medium),
              suffixIcon: const Icon(Icons.arrow_drop_down_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              filled: true,
              fillColor: Colors.transparent,
              hintText: 'Select tutor nationality',
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: colorProject.primaryColor, width: 1.5),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
