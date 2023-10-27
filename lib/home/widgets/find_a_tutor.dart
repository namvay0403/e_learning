import 'package:flutter/material.dart';

import '../../../utilities/constants/constants.dart';

class FindATutor extends StatelessWidget {
  const FindATutor({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: TextFormField(
            style: TextStyle(fontFamily: fontApp),
            decoration: InputDecoration(
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
            ),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 50,
          child: TextFormField(
            style: const TextStyle(fontFamily: fontApp),
            decoration: InputDecoration(
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
