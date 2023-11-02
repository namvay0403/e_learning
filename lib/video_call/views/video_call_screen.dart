import 'package:flutter/material.dart';

import '../widgets/bottom_nav.dart';
import '../widgets/mini_video.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: const Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomNav(),
          ),
          Align(
            alignment: Alignment.topRight,
            child: MiniVideo(),
          ),
        ],
      ),
    );
  }
}
