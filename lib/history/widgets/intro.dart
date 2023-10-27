import 'package:flutter/material.dart';

import '../../utilities/constants/constants.dart';

class IntroForHistory extends StatelessWidget {
  const IntroForHistory({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: size.width / 3,
            child: Image.asset(AppAssets.history),
          ),
          Text(
            'History',
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
                    'The following is a list of lessons you have attended'
                    '\nYou can review the details of the lessons you have attended',
                    textAlign: TextAlign.left,
                    softWrap: true,
                    style: textStyle.normalStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
