import 'package:flutter/material.dart';

import '../../utilities/constants/constants.dart';
import '../../utilities/constants/list_provider.dart';

class UpcommingLesson extends StatelessWidget {
  const UpcommingLesson({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.3,
      width: size.width,
      color: colorProject.primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Upcoming lesson',
                style: TextStyle(
                  fontFamily: fontBoldApp,
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize.large,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sat, 21 Oct 23',
                      style: TextStyle(
                        fontFamily: fontBoldApp,
                        fontSize: fontSize.medium,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '01:00-01:25',
                      style: TextStyle(
                        fontFamily: fontBoldApp,
                        fontSize: fontSize.medium,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '(starts in 10:01:25)',
                      style: TextStyle(
                        fontFamily: fontBoldApp,
                        fontSize: fontSize.medium,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Icon(Icons.video_collection_outlined),
                      Text('Enter lesson room'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 17),
            Text(
              'Total lesson time is ${user.totalHour} hours ${user.totalMinute} minutes',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: fontSize.medium,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
