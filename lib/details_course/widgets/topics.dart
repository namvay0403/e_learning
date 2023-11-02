import 'package:e_learning/details_course/widgets/details_topic.dart';
import 'package:e_learning/utilities/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ListTopics extends StatefulWidget {
  const ListTopics({super.key});

  @override
  State<ListTopics> createState() => _ListTopicsState();
}

class _ListTopicsState extends State<ListTopics> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 7,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () => {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const DetailsTopic()))
          },
          child: CardTopic(index: index, context: context),
        );
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
