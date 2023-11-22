import 'package:flutter/material.dart';

import '../../home/widgets/card_filter.dart';
import '../../teachers/model/teacher_model.dart';
import '../../utilities/constants/constants.dart';
import '../view/detail_teacher_page.dart';

class ProfileTeacher extends StatelessWidget {
  const ProfileTeacher({super.key, required this.teacher});

  final Teacher teacher;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(AppAssets.avatar),
                  radius: 40,
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      teacher.name,
                      style: TextStyle(
                        fontFamily: fontBoldApp,
                        fontSize: fontSize.large,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(teacher.country),
                    Row(
                      children: [
                        Text('${teacher.rating}/5'),
                        const Text('(127)'),
                      ],
                    )
                  ],
                ),
              ],
            ),
            Column(
              children: [
                teacher.isFavourite
                    ? Icon(
                        Icons.favorite,
                        size: 35,
                        color: Colors.red,
                      )
                    : Icon(
                        Icons.favorite,
                        size: 35,
                        color: Colors.grey,
                      ),
                Icon(
                  Icons.report_gmailerrorred,
                  size: 35,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 30),
        Text(
          '${teacher.description}',
          softWrap: true,
          style: TextStyle(
            fontFamily: fontApp,
          ),
        ),
        const SizedBox(height: 25),
        SizedBox(
          height: 300,
          width: size.width,
          child: Image.asset(AppAssets.avatar),
        ),
        const SizedBox(height: 25),
        const Text(
          'Education',
          style: TextStyle(
            fontFamily: fontBoldApp,
            fontSize: fontSize.large,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'BA',
            style: TextStyle(
              fontFamily: fontBoldApp,
              fontSize: fontSize.large,
              color: Colors.black54,
            ),
          ),
        ),
        const SizedBox(height: 25),
        const Text(
          'Languages',
          style: TextStyle(
            fontFamily: fontBoldApp,
            fontSize: fontSize.large,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              CardCustom(text: 'English'),
            ],
          ),
        ),
        const SizedBox(height: 25),
        const Text(
          'Specialties',
          style: TextStyle(
            fontFamily: fontBoldApp,
            fontSize: fontSize.large,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              for (var item in teacher.specialities) CardCustom(text: item)
            ],
          ),
        ),
        const SizedBox(height: 25),
        const Text(
          'Suggested courses',
          style: TextStyle(
            fontFamily: fontBoldApp,
            fontSize: fontSize.large,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text.rich(
            TextSpan(
              text: 'Basic Conversation Topics: ',
              style: TextStyle(
                fontFamily: fontBoldApp,
                fontSize: fontSize.medium,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: 'Link',
                  style: TextStyle(
                    color: colorProject.primaryColor,
                    fontFamily: fontApp,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text.rich(
            TextSpan(
              text: 'Life in the Internet Age: ',
              style: TextStyle(
                fontFamily: fontBoldApp,
                fontSize: fontSize.medium,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: 'Link',
                  style: TextStyle(
                    color: colorProject.primaryColor,
                    fontFamily: fontApp,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 25),
        const Text(
          'Interests',
          style: TextStyle(
            fontFamily: fontBoldApp,
            fontSize: fontSize.large,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'I loved the weather, the scenery and the laid-back lifestyle of the locals.',
            style: TextStyle(
              fontFamily: fontApp,
              fontSize: fontSize.medium,
              color: Colors.black54,
            ),
          ),
        ),
        const SizedBox(height: 25),
        const Text(
          'Teaching experience',
          style: TextStyle(
            fontFamily: fontBoldApp,
            fontSize: fontSize.large,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'I have more than 10 years of teaching english experience',
            style: TextStyle(
              fontFamily: fontApp,
              fontSize: fontSize.medium,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }
}
