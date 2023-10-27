import 'package:flutter/material.dart';
import '../../utilities/constants/constants.dart';

class DetailHistoryWithComment extends StatelessWidget {
  const DetailHistoryWithComment({super.key});

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
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              'Lesson Time: 02:00 - 03:25',
              style: textStyle.normalStyle(),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: colorProject.primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(padding.small),
                child: Row(
                  children: [
                    const Icon(Icons.radio_button_checked, color: Colors.white),
                    Text(
                      'Record',
                      style: textStyle.normalStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ),
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
            padding: EdgeInsets.all(padding.medium),
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
          child: Padding(
            padding: const EdgeInsets.all(padding.medium),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Review tutor"),
                    Icon(Icons.keyboard_arrow_down_outlined),
                  ],
                ),
                sizedBox.largeHeight(),
                Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Session 1: 22:00 - 22:25',
                        style: textStyle.headerStyle(fontSize: 16),
                      ),
                      const Text('Lesson status: Complete - Page: 40'),
                      const Text('Lesson progress: Completed'),
                      const Row(
                        children: [
                          Text('Behavior: '),
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.yellow),
                        ],
                      ),
                      const Row(
                        children: [
                          Text('Listening: '),
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.yellow),
                        ],
                      ),
                      const Row(
                        children: [
                          Text('Speaking: '),
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.yellow),
                        ],
                      ),
                      const Row(
                        children: [
                          Text('Vocabulary: '),
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.yellow),
                        ],
                      ),
                      const Text('Overall comment: We finished this lesson'),
                    ],
                  ),
                )
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
