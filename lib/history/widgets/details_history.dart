import 'package:e_learning/history/model/history_courses_model.dart';
import 'package:e_learning/utilities/constants/list_provider.dart';
import 'package:flutter/material.dart';

import '../../utilities/constants/constants.dart';

class DetailHistory extends StatelessWidget {
  const DetailHistory({super.key, required this.historyCourse});

  final HistoryCourses historyCourse;

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
              Text(
                  '${historyCourse.time.month},${historyCourse.time.day},${historyCourse.time.year}',
                  style: textStyle.headerStyle()),
              Text('${historyCourse.timeAgo} hours ago'),
              personalInfo(teacherId: historyCourse.teacherId),
              sizedBox.largeHeight(),
              infoLesson(
                  start: historyCourse.start,
                  end: historyCourse.end,
                  size: size.width),
              sizedBox.largeHeight(),
              requestForLesson(
                  request: historyCourse.request, review: historyCourse.review),
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
    {required double size, required DateTime start, required DateTime end}) {
  return Container(
    color: Colors.white,
    width: size,
    child: Padding(
      padding: const EdgeInsets.all(padding.medium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lesson Time: ${start.hour}:${start.minute} - ${end.hour}:${end.minute}',
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
          color: colorProject.primaryColor,
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

Widget personalInfo({required int teacherId}) {
  return Container(
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(padding.medium),
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
                '${teachers[teacherId].name}',
                style: textStyle.headerStyle(fontSize: 15),
              ),
              Text('${teachers[teacherId].country}'),
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
