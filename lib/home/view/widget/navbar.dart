import 'package:e_learning/login/login.dart';
import 'package:e_learning/utilities/constants/constants.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              'Le Thanh Nam',
              style: TextStyle(
                fontFamily: fontApp,
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: const Text(
              'ltnam43202@gmail.com',
              style: TextStyle(
                fontFamily: fontApp,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(AppAssets.avatar),
            ),
            decoration: const BoxDecoration(
              color: colorProject.primaryColor,
            ),
          ),
          const ListTileWidget(),
          Footer(),
        ],
      ),
    );
  }
}

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.table_view),
          title: const Text(
            'Recurring Lesson Schedule',
            style: TextStyle(
              fontFamily: fontBoldApp,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.computer),
          title: const Text(
            'Tutor',
            style: TextStyle(
              fontFamily: fontBoldApp,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.schedule),
          title: const Text(
            'Schedule',
            style: TextStyle(
              fontFamily: fontBoldApp,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.history),
          title: const Text(
            'History',
            style: TextStyle(
              fontFamily: fontBoldApp,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.play_lesson),
          title: const Text(
            'Courses',
            style: TextStyle(
              fontFamily: fontBoldApp,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.play_lesson_rounded),
          title: const Text(
            'My Courses',
            style: TextStyle(
              fontFamily: fontBoldApp,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text(
            'Become a tutor',
            style: TextStyle(
              fontFamily: fontBoldApp,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text(
            'Logout',
            style: TextStyle(
              fontFamily: fontBoldApp,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {},
        ),
      ],
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Copyright © 2021 Tutoring. All rights reserved',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: fontBoldApp,
            fontWeight: FontWeight.bold,
            fontSize: fontSize.medium,
          ),
        ),
        Text(
          'LETTUTOR VIET NAM COMPANY LIMITED (TC: 0317003289)',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: fontBoldApp,
            fontWeight: FontWeight.bold,
            fontSize: fontSize.medium,
          ),
        ),
        Text(
          'Headquarters: 9 Street No. 3, KDC Cityland Park Hills, Ward 10, Go Vap District, Ho Chi Minh City.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: fontBoldApp,
            fontWeight: FontWeight.bold,
            fontSize: fontSize.medium,
          ),
        ),
        Text(
          'Phone: +84 945 337 337.Email: hello@lettutor.com',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: fontBoldApp,
            fontWeight: FontWeight.bold,
            fontSize: fontSize.medium,
          ),
        )
      ],
    );
  }
}
