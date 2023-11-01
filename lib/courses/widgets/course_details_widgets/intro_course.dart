import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:e_learning/utilities/constants/constants.dart';

class IntroCourse extends StatelessWidget {
  const IntroCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(
              Icons.question_mark,
              color: Colors.red,
            ),
            sizedBox.mediumHeight(),
            Text(
              'Why take this course',
              style: textStyle.headerStyle(fontSize: 16),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: padding.medium),
          child: Text(
              'Our world is rapidly changing thanks to new technology, and the vocabulary needed to discuss modern life is evolving almost daily. In this course you will learn the most up-to-date terminology from expertly crafted lessons as well from your native-speaking tutor.'),
        ),
        sizedBox.largeHeight(),
        Row(
          children: [
            const Icon(
              Icons.question_mark,
              color: Colors.red,
            ),
            sizedBox.mediumHeight(),
            Text(
              'What will you be able to do',
              style: textStyle.headerStyle(fontSize: 16),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: padding.medium),
          child: Text(
            'You will learn vocabulary related to timely topics like remote work, artificial intelligence, online privacy, and more. In addition to discussion questions, you will practice intermediate level speaking tasks such as using data to describe trends.',
          ),
        ),
      ],
    );
  }
}
