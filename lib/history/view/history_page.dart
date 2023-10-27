import 'package:e_learning/history/history.dart';
import 'package:flutter/material.dart';

import '../../home/widgets/navbar.dart';
import '../../utilities/constants/constants.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // floatingActionButton: Column(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     FloatingActionButton(
      //       backgroundColor: colorProject.primaryColor,
      //       onPressed: () {
      //         //...
      //       },
      //       heroTag: null,
      //       child: const Icon(
      //         Icons.card_giftcard,
      //         color: Colors.white,
      //       ),
      //     ),
      //     const SizedBox(height: 10),
      //     FloatingActionButton(
      //       backgroundColor: colorProject.primaryColor,
      //       onPressed: () {},
      //       heroTag: null,
      //       child: const Icon(
      //         Icons.chat,
      //         color: Colors.white,
      //       ),
      //     )
      //   ],
      // ),
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
      body: const HistoryScreen(),
    );
  }
}
