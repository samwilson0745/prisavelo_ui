import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';


class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        "https://firebasestorage.googleapis.com/v0/b/prisavelo-7a2f8.appspot.com/o/course%2Ff7PZMdcTVXdk69d8JZNxBq7cDhE2%2F01199587-3ff3-4bfc-90dd-82bca242cc00_1.mp4?alt=media&token=95291df0-4604-4343-a561-9a0f4a772120"
    )
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff03071e),
      body: _controller.value.isInitialized
          ? RotatedBox(
        quarterTurns: 1,
        child: AspectRatio(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  flex:22,
                  child: VideoPlayer(
                      _controller
                  )
              ),
              Expanded(
                flex:1,
                child: VideoProgressIndicator(
                  _controller,
                  allowScrubbing: true,colors: VideoProgressColors(
                    playedColor: Colors.red,
                    backgroundColor: Color(0xff03071e)
                  ),
                ),
              ),
            ],
          ),
          aspectRatio: 16/9,
        ),
      ):Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(
                  () {
                _controller.value.isPlaying
                ?_controller.pause()
                :_controller.play();
            }
          );
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}