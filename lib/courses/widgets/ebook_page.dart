import 'package:e_learning/utilities/constants/constants.dart';
import 'package:flutter/material.dart';

class EbookPage extends StatefulWidget {
  const EbookPage({super.key});

  @override
  State<EbookPage> createState() => _EbookPageState();
}

class _EbookPageState extends State<EbookPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'E-Book',
        style: textStyle.headerStyle(),
      ),
    );
  }
}
