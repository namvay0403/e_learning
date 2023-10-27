import 'package:flutter/material.dart';

import '../../home/widgets/card_filter.dart';
import '../../utilities/constants/constants.dart';
import '../view/detail_teacher_page.dart';

class ProfileTeacher extends StatelessWidget {
  const ProfileTeacher({super.key});

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
                        Text('(127)'),
                      ],
                    )
                  ],
                ),
              ],
            ),
            const Column(
              children: [
                Icon(
                  Icons.favorite_border,
                  size: 35,
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
        const Text(
          'Hello! My name is April Baldo, you can just call me Teacher April. I am an English teacher and currently teaching in senior high school. I have been teaching grammar and literature for almost 10 years. I am fond of reading and teaching literature....',
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
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              CardCustom(text: 'English for Business'),
              CardCustom(text: 'IELTS'),
              CardCustom(text: 'PET'),
              CardCustom(text: 'KET'),
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
