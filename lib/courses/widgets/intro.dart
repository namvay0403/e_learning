import 'package:flutter/material.dart';

import '../../utilities/constants/constants.dart';

class IntroCourses extends StatelessWidget {
  const IntroCourses({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
