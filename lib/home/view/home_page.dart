import 'package:flutter/material.dart';

import '../../utilities/constants/constants.dart';
import '../widgets/card_filter.dart';
import '../widgets/find_a_tutor.dart';
import '../widgets/navbar.dart';
import '../widgets/recommend_teacher.dart';
import '../widgets/select_time.dart';
import '../widgets/upcomming_lesson.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UpcommingLesson(),
              SizedBox(height: 20),
              Text(
                'Find a tutor',
                style: TextStyle(
                  fontFamily: fontBoldApp,
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize.large,
                ),
              ),
              SizedBox(height: 20),
              FindATutor(),
              SizedBox(height: 20),
              Text(
                'Select available tutoring time:',
                style: TextStyle(
                  fontFamily: fontBoldApp,
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize.medium,
                ),
              ),
              SizedBox(height: 20),
              SelectTime(),
              SizedBox(height: 20),
              CardFilter(),
              SizedBox(height: 20),
              Text(
                'Recommended Tutors',
                style: TextStyle(
                  fontFamily: fontBoldApp,
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize.large,
                ),
              ),
              SizedBox(height: 15),
              RecommendTeacher(),
            ],
          ),
        ),
      ),
    );
  }
}
