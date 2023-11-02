import 'package:flutter/material.dart';
import 'package:e_learning/utilities/constants/constants.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              text,
              style: textStyle.headerStyle(fontSize: 20),
            ),
          ),
          Expanded(
            child: Container(
              height: 1,
              color: Colors.black12,
            ),
          )
        ],
      ),
    );
  }
}
