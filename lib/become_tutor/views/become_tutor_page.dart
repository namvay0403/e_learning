import 'package:e_learning/become_tutor/views/become_tutor_screen.dart';
import 'package:flutter/material.dart';

import '../../home/widgets/navbar.dart';
import '../../utilities/constants/constants.dart';

class BecomeTutorPage extends StatefulWidget {
  const BecomeTutorPage({super.key});

  @override
  State<BecomeTutorPage> createState() => _BecomeTutorPageState();
}

class _BecomeTutorPageState extends State<BecomeTutorPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: NavBar(),
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
      body: const BecomeTutorScreen(),
    );
  }
}
