import 'package:e_learning/schedule/model/schedule_model.dart';
import 'package:flutter/material.dart';

import '../../utilities/constants/constants.dart';

class DetailLesson extends StatelessWidget {
  const DetailLesson({super.key, required this.scheduleModel});

  final ScheduleModel scheduleModel;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: size.width,
        decoration: const BoxDecoration(
          color: Colors.black12,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Thu, 26 Oct 23', style: textStyle.headerStyle()),
              const Text('1 lesson'),
              personalInfo(),
              sizedBox.largeHeight(),
              infoLesson(),
              sizedBox.largeHeight(),
              button(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget infoLesson() {
  return Container(
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Text(
            'Lesson Time: 02:00 - 03:25',
            style: textStyle.normalStyle(fontSize: 20),
          ),
          sizedBox.largeHeight(),
          infoTimeLesson(time: 'Session 1: 02:00 - 02:25'),
          sizedBox.mediumHeight(),
          infoTimeLesson(time: 'Session 2: 02:30 - 02:55'),
          sizedBox.mediumHeight(),
          infoTimeLesson(time: 'Session 3: 03:00 - 03:25'),
          sizedBox.mediumHeight(),
          requestForLesson(),
        ],
      ),
    ),
  );
}

Widget button() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            'Go to meetings',
            style: textStyle.normalStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
        ),
      )
    ],
  );
}

Widget requestForLesson() {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black12),
    ),
    child: Column(
      children: [
        Container(
          color: Colors.black12,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(Icons.keyboard_arrow_down_sharp),
                    Text('Request for lesson'),
                  ],
                ),
                Text(
                  'Edit Request',
                  style:
                      textStyle.normalStyle(color: colorProject.primaryColor),
                ),
              ],
            ),
          ),
        ),
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              'Currently there are no requests for this class. Please write down any requests for the teacher.',
              style: textStyle.normalStyle(color: Colors.grey),
            ),
          ),
        )
      ],
    ),
  );
}

Widget infoTimeLesson({required String time}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(time),
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              const Icon(
                Icons.cancel_presentation,
                color: Colors.red,
                size: 20,
              ),
              Text(
                'Cancel',
                style: textStyle.normalStyle(color: Colors.red, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget personalInfo() {
  return Container(
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(AppAssets.avatar),
            radius: 40,
          ),
          sizedBox.largeWidth(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'LE THANH NAM',
                style: textStyle.headerStyle(fontSize: 15),
              ),
              const Text('Viet Nam'),
              Row(
                children: [
                  const Icon(
                    Icons.chat_bubble,
                    color: colorProject.primaryColor,
                    size: 14,
                  ),
                  Text(
                    'Direct Message',
                    style:
                        textStyle.normalStyle(color: colorProject.primaryColor),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
