import 'package:flutter/material.dart';

import '../../home/view/widget/navbar.dart';
import '../../utilities/constants/constants.dart';
import '../widget/detail_lesson.dart';
import '../widget/intro.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: colorProject.primaryColor,
            onPressed: () {
              //...
            },
            heroTag: null,
            child: const Icon(
              Icons.card_giftcard,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            backgroundColor: colorProject.primaryColor,
            onPressed: () {},
            heroTag: null,
            child: const Icon(
              Icons.chat,
              color: Colors.white,
            ),
          )
        ],
      ),
      drawer: const NavBar(),
      appBar: AppBar(
        title: SizedBox(
          width: size.width * 0.4,
          child: Image.asset(AppAssets.logo),
        ),
        actions: [
          Icon(
            Icons.flag_circle,
            size: size.width * 0.1,
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Intro(),
              sizedBox.mediumHeight(),
              const Divider(color: Colors.black12),
              sizedBox.largeHeight(),
              const DetailLesson(),
              const DetailLesson(),
            ],
          ),
        ),
      ),
    );
  }
}
