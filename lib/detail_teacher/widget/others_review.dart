import 'package:e_learning/utilities/constants/constants.dart';
import 'package:flutter/material.dart';

class OthersReview extends StatelessWidget {
  const OthersReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        comment(),
        comment(),
        comment(),
        comment(),
        comment(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back_ios,
                ),
              ),
            ),
            const SizedBox(width: 5),
            Container(
              alignment: Alignment.center,
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: const Text(
                '1',
                style: TextStyle(fontSize: fontSize.large),
              ),
            ),
            const SizedBox(width: 5),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward_ios,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget comment() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(AppAssets.avatar),
            radius: 15,
          ),
          const SizedBox(width: 10),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'LE THANH NAM',
                    style: TextStyle(
                      fontFamily: fontApp,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'a day ago',
                    style: TextStyle(
                      fontFamily: fontApp,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Icon(Icons.star),
                  Icon(Icons.star),
                  Icon(Icons.star),
                  Icon(Icons.star),
                ],
              ),
              Text(
                'Good Teacher',
                style: TextStyle(
                  fontFamily: fontApp,
                  fontSize: fontSize.medium,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
