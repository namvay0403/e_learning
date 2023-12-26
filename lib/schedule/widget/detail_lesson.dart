import 'package:e_learning/schedule/model/schedule_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
              Text(scheduleModel.scheduleDetailInfo!.scheduleInfo!.date,
                  style: textStyle.headerStyle()),
              const Text('1 lesson'),
              personalInfo(
                  scheduleModel
                      .scheduleDetailInfo!.scheduleInfo!.tutorInfo!.avatar,
                  scheduleModel
                      .scheduleDetailInfo!.scheduleInfo!.tutorInfo!.name,
                  scheduleModel
                      .scheduleDetailInfo!.scheduleInfo!.tutorInfo!.country),
              sizedBox.largeHeight(),
              infoLesson(
                  scheduleModel.scheduleDetailInfo!.scheduleInfo!.startTime,
                  scheduleModel.scheduleDetailInfo!.scheduleInfo!.endTime),
              sizedBox.largeHeight(),
              button(scheduleModel.tutorMeetingLink!),
            ],
          ),
        ),
      ),
    );
  }
}

Widget infoLesson(String startTime, String endTime) {
  return Container(
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Text(
            'Lesson Time: ${startTime} - ${endTime}',
            style: textStyle.normalStyle(fontSize: 20),
          ),
          sizedBox.largeHeight(),
          requestForLesson(),
        ],
      ),
    ),
  );
}

Widget button(String tutorMeetingLink) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            color: tutorMeetingLink == null
                ? Colors.grey
                : colorProject.primaryColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Go to meetings',
              style: textStyle.normalStyle(
                fontSize: 20,
                color: tutorMeetingLink == null ? Colors.grey : Colors.white,
              ),
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

Widget personalInfo(String avatar, String name, String country) {
  return Container(
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(avatar),
            radius: 40,
          ),
          sizedBox.largeWidth(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: textStyle.headerStyle(fontSize: 15),
              ),
              Text(country),
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
