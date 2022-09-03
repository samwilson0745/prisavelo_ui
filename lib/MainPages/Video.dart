import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class VideoApp extends StatefulWidget {
  final String url;

  VideoApp(this.url,);
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController:
      VideoPlayerController.network(widget.url),
    );
  }
  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff03071e),
        body: Center(
          child: AspectRatio(
            aspectRatio: 16/9,
            child:FlickVideoPlayer(
              preferredDeviceOrientation: [
                DeviceOrientation.portraitUp,
                DeviceOrientation.landscapeLeft
              ],
              flickManager: flickManager,
              flickVideoWithControls: FlickVideoWithControls(
                controls: FlickPortraitControls(
                  progressBarSettings: FlickProgressBarSettings(
                    playedColor: Colors.red
                  ),
                ),
              ),
            )
            ),
        ),
        );
  }

}