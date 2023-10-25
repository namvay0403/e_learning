import 'package:e_learning/utilities/constants/constants.dart';
import 'package:flutter/material.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: size.width / 2,
            child: Image.asset(AppAssets.schedule),
          ),
          Text(
            'Schedule',
            style: textStyle.headerStyle(),
          ),
          sizedBox.smallHeight(),
          IntrinsicHeight(
            child: Row(
              children: [
                const VerticalDivider(
                  color: Colors.grey,
                  thickness: 2,
                ),
                Flexible(
                  child: Text(
                    'Here is a list of the sessions you have booked. \nYou can track when the meeting starts, join the meeting with one click or can cancel the meeting before 2 hours',
                    textAlign: TextAlign.left,
                    softWrap: true,
                    style: textStyle.normalStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          sizedBox.largeHeight(),
          Text(
            'Latest Book',
            style: textStyle.headerStyle(fontSize: 20),
          ),
          Column(
            children: [
              latestBook(
                  name: 'Name',
                  detail: 'sample.pdf',
                  color: colorProject.primaryColor),
              latestBook(name: 'Page', detail: '0', color: Colors.black),
              latestBook(
                  name: 'Description', detail: 'sample', color: Colors.black),
            ],
          ),
        ],
      ),
    );
  }

  Widget latestBook(
      {required String name, required String detail, required Color color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(color: Colors.black26),
              ),
              child: Text(
                name,
                style: textStyle.normalStyle(fontSize: 20),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
              ),
              child: Text(
                detail,
                style: textStyle.normalStyle(fontSize: 20, color: color),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
