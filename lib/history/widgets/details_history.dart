import 'package:flutter/material.dart';

import '../../utilities/constants/constants.dart';

class DetailHistory extends StatelessWidget {
  const DetailHistory({super.key});

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
              const Text('15 hours ago'),
              personalInfo(),
              sizedBox.largeHeight(),
              infoLesson(context),
              sizedBox.largeHeight(),
              requestForLesson(),
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

Widget infoLesson(context) {
  return Container(
    color: Colors.white,
    width: MediaQuery.of(context).size.width,
    child: Padding(
      padding: const EdgeInsets.all(padding.medium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lesson Time: 02:00 - 03:25',
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

Widget requestForLesson() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.black12),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
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
                Text('No request for lesson'),
                Icon(Icons.keyboard_arrow_down_sharp),
              ],
            ),
          ),
        ),
        Container(
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
        ),
      ],
    ),
  );
}

Widget personalInfo() {
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
