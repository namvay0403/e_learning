import 'package:e_learning/utilities/constants/constants.dart';
import 'package:flutter/material.dart';

class ListTopics extends StatelessWidget {
  const ListTopics({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 7,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return CardTopic(index: index, context: context);
      },
    );
  }

  Widget CardTopic({required int index, required context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: padding.medium),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 70,
        width: MediaQuery.of(context).size.width / 2,
        child: Padding(
          padding: const EdgeInsets.all(padding.medium),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '$index. The Internet',
                style: textStyle.headerStyle(fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
