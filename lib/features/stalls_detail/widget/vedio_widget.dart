import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gatherly/utill/color_resources.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';

class FullScreenVideoPlayer extends StatefulWidget {
  final String filepath;

  const FullScreenVideoPlayer({Key? key, required this.filepath})
      : super(key: key);

  @override
  _FullScreenVideoPlayerState createState() => _FullScreenVideoPlayerState();
}

class _FullScreenVideoPlayerState extends State<FullScreenVideoPlayer> {
  late VideoPlayerController _controller;
  bool _isFullScreen = false;
  RxBool isload=true.obs;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.filepath))
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
    _controller.addListener(() {
      isload.value=false;
      isload.value=true;
     
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    if (_isFullScreen) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: SystemUiOverlay.values);
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    }
    super.dispose();
  }



  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
  }

  void _seekForward() {
    final currentPosition = _controller.value.position;
    final newPosition = currentPosition + const Duration(seconds: 10);
    _controller.seekTo(newPosition);
  }

  void _seekBackward() {
    final currentPosition = _controller.value.position;
    final newPosition = currentPosition - const Duration(seconds: 10);
    _controller.seekTo(newPosition);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: Stack(
                  children: [
                    VideoPlayer(_controller),
                    _buildControls(context),
                  ],
                ),
              )
            : const CircularProgressIndicator(),
      ),

    );
  }

  Widget _buildControls(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          VideoProgressIndicator(
            _controller,
            allowScrubbing: true,
            colors: const VideoProgressColors(),
            padding: EdgeInsets.symmetric(horizontal: 18),
          ),
          Obx(() => isload.value?Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _formatDuration(_controller.value.position),
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  _formatDuration(_controller.value.duration),
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ):SizedBox()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: IconButton(
                  icon: const Icon(Icons.replay_10, color: Colors.white,size: 50,),
                  onPressed: _seekBackward,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (_controller.value.isPlaying) {
                      _controller.pause();
                    } else {
                      _controller.play();
                    }
                  });
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: ColorResources.stallsButton,
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Icon(
                    _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.forward_10, color: Colors.white,size: 50,),
                onPressed: _seekForward,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
