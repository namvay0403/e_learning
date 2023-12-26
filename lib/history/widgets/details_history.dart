import 'package:e_learning/history/model/history_courses_model.dart';
import 'package:e_learning/utilities/constants/list_provider.dart';
import 'package:flutter/material.dart';

import '../../schedule/model/schedule_model.dart';
import '../../utilities/constants/constants.dart';

class DetailHistory extends StatelessWidget {
  const DetailHistory({super.key, required this.scheduleModel});

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
              Text('${scheduleModel.scheduleDetailInfo!.scheduleInfo!.date}',
                  style: textStyle.headerStyle()),
              personalInfo(
                  scheduleModel
                      .scheduleDetailInfo!.scheduleInfo!.tutorInfo!.avatar,
                  scheduleModel
                      .scheduleDetailInfo!.scheduleInfo!.tutorInfo!.name,
                  scheduleModel
                      .scheduleDetailInfo!.scheduleInfo!.tutorInfo!.country),
              sizedBox.largeHeight(),
              infoLesson(
                  start:
                      scheduleModel.scheduleDetailInfo!.scheduleInfo!.startTime,
                  end: scheduleModel.scheduleDetailInfo!.scheduleInfo!.endTime,
                  size: size.width),
              sizedBox.largeHeight(),
              requestForLesson(request: 'No request', review: 'No review'),
              observe(),
              sizedBox.mediumHeight(),
              button(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget observe() {
  return Container(
    decoration: const BoxDecoration(
      color: Colors.white,
      border: Border(
        bottom: BorderSide(width: 0.5, color: Colors.grey),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(padding.medium),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Add rating',
            style: textStyle.normalStyle(color: colorProject.primaryColor),
          ),
          Text(
            'Report',
            style: textStyle.normalStyle(color: colorProject.primaryColor),
          )
        ],
      ),
    ),
  );
}

Widget infoLesson(
    {required double size, required String start, required String end}) {
  return Container(
    color: Colors.white,
    width: size,
    child: Padding(
      padding: const EdgeInsets.all(padding.medium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lesson Time: $start - $end',
            style: textStyle.normalStyle(fontSize: 20),
          ),
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
        decoration: const BoxDecoration(
          color: Colors.grey,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            'Go to meeting',
            style: textStyle.normalStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      )
    ],
  );
}

Widget requestForLesson({required String request, required String review}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.black12),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        request.isEmpty
            ? Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 0.5, color: Colors.grey),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('No request for lesson'),
                      Icon(Icons.keyboard_arrow_down_sharp),
                    ],
                  ),
                ),
              )
            : Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 0.5, color: Colors.grey),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('No request for lesson'),
                          Icon(Icons.keyboard_arrow_down_sharp),
                        ],
                      ),
                      Container(
                        color: Colors.white,
                        child: Text('${request}'),
                      )
                    ],
                  ),
                ),
              ),
        review.isEmpty
            ? Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 0.5, color: Colors.grey),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Tutor haven't reviewed yet"),
                      Icon(Icons.keyboard_arrow_down_sharp),
                    ],
                  ),
                ),
              )
            : Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 0.5, color: Colors.grey),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Tutor haven't reviewed yet"),
                          Icon(Icons.keyboard_arrow_down_sharp),
                        ],
                      ),
                      Container(
                        color: Colors.white,
                        child: Text('${review}'),
                      )
                    ],
                  ),
                ),
              ),
      ],
    ),
  );
}

Widget personalInfo(String avatar, String name, String country) {
  return Container(
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(padding.medium),
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
