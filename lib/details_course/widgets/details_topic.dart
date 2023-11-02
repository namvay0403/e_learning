import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class DetailsTopic extends StatelessWidget {
  const DetailsTopic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: const Text("PDF View"),
        ),
        body:
            // link fron internet
            SfPdfViewer.network(
          "https://api.app.lettutor.com/file/be4c3df8-3b1b-4c8f-a5cc-75a8e2e6626afileFoods%20You%20Love.pdf",
        )
        // SfPdfViewer.asset("asset/proposal.pdf"),
        );
  }
}
