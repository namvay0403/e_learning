import 'package:e_learning/utilities/constants/constants.dart';
import 'package:e_learning/video_call/views/video_call_screen.dart';
import 'package:flutter/material.dart';

class VideoCallPage extends StatefulWidget {
  const VideoCallPage({super.key});

  @override
  State<VideoCallPage> createState() => _VideoCallPageState();
}

class _VideoCallPageState extends State<VideoCallPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Video Call',
          style: textStyle.headerStyle(fontSize: 18),
        ),
      ),
      body: const VideoCallScreen(),
    );
  }
}
