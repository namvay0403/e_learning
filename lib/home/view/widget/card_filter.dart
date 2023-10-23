import 'package:flutter/material.dart';

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
        ElevatedButton(onPressed: () {}, child: const Text('Reset Filters')),
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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color(0xC4B1B1B5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: fontApp,
            fontSize: fontSize.medium,
          ),
        ),
      ),
    );
  }
}
