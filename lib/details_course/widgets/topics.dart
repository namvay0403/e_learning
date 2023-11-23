import 'package:e_learning/courses/model/course_model.dart';
import 'package:e_learning/details_course/widgets/details_topic.dart';
import 'package:e_learning/utilities/constants/constants.dart';
import 'package:e_learning/video_call/video_call.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ListTopics extends StatefulWidget {
  const ListTopics({super.key, required this.course});

  final Course course;

  @override
  State<ListTopics> createState() => _ListTopicsState();
}

class _ListTopicsState extends State<ListTopics> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.course.topics.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        var topic = widget.course.topics[index];
        return InkWell(
          onTap: () => {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const DetailsTopic()))
          },
          child: CardTopic(topic: topic, context: context),
        );
      },
    );
  }

  Widget CardTopic({required String topic, required context}) {
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
                topic,
                style: textStyle.headerStyle(fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
