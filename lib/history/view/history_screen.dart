import 'package:flutter/material.dart';
import '../../utilities/constants/constants.dart';

import '../widgets/detail_history_with_comment.dart';
import '../widgets/details_history.dart';
import '../widgets/intro.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: padding.medium),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const IntroForHistory(),
            sizedBox.mediumHeight(),
            const Divider(color: Colors.black12),
            sizedBox.largeHeight(),
            const DetailHistory(),
            const DetailHistoryWithComment(),
          ],
        ),
      ),
    );
  }
}
