import 'package:flutter/material.dart';

import '../../../utilities/constants/constants.dart';

class SelectTime extends StatelessWidget {
  const SelectTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: TextFormField(
            style: const TextStyle(fontFamily: fontApp),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              filled: true,
              fillColor: Colors.transparent,
              hintText: 'Select a day',
              suffixIcon: const Icon(Icons.calendar_month),
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
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 50,
                child: TextFormField(
                  style: const TextStyle(fontFamily: fontApp),
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.watch_later_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    fillColor: Colors.transparent,
                    hintText: 'Start time',
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
            ),
            const SizedBox(width: 15),
            Expanded(
              child: SizedBox(
                height: 50,
                child: TextFormField(
                  style: const TextStyle(fontFamily: fontApp),
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.watch_later_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    fillColor: Colors.transparent,
                    hintText: 'End time',
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
            ),
          ],
        )
      ],
    );
  }
}
