import 'package:e_learning/utilities/constants/constants.dart';
import 'package:flutter/material.dart';

class InteractiveEBookPage extends StatefulWidget {
  const InteractiveEBookPage({super.key});

  @override
  State<InteractiveEBookPage> createState() => _InteractiveEBookPageState();
}

class _InteractiveEBookPageState extends State<InteractiveEBookPage> {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Interactive E-book',
      style: textStyle.headerStyle(),
    );
  }
}
