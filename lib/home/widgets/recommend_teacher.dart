import 'package:e_learning/detail_teacher/detail_teacher.dart';
import 'package:e_learning/utilities/constants/constants.dart';
import 'package:flutter/material.dart';

import 'card_filter.dart';

class RecommendTeacher extends StatelessWidget {
  const RecommendTeacher({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        CardTeacher(),
        CardTeacher(),
        CardTeacher(),
        CardTeacher(),
        CardTeacher(),
      ],
    );
  }
}

class CardTeacher extends StatelessWidget {
  const CardTeacher({super.key});

  // final String name;
  // final String country;
  // final String avatar;
  // final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 30,
            spreadRadius: 10,
            offset: const Offset(0, 10),
          ),
        ],
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
                                  builder: (_) => const DetailTeacherPage())),
                          child: const Text(
                            'April Baldo',
                            style: TextStyle(
                              fontFamily: fontBoldApp,
                              fontSize: fontSize.large,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Text('Philipines'),
                        const Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                const Icon(
                  Icons.favorite_border,
                  size: 35,
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                CardCustom(text: 'English for Business'),
                CardCustom(text: 'IELTS'),
                CardCustom(text: 'PET'),
                CardCustom(text: 'KET'),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              'Hello! My name is April Baldo, you can just call me Teacher April. I am an English teacher and currently teaching in senior high school. I have been teaching grammar and literature for almost 10 years. I am fond of reading and teaching literature....',
              softWrap: true,
              style: TextStyle(
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
