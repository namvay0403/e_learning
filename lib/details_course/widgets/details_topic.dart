import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class DetailsTopic extends StatelessWidget {
  const DetailsTopic(
      {super.key, required this.topicLink, required this.topicName});

  final String topicLink;
  final String topicName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: Text(topicName),
        ),
        body:
            // link fron internet
            SfPdfViewer.network(
          topicLink,
        )
        // SfPdfViewer.asset("asset/proposal.pdf"),
        );
  }
}
