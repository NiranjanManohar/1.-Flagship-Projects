import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'BotNavi.dart';
class play extends StatefulWidget {
  const play({super.key});

  @override
  State<play> createState() => _playState();
}

class _playState extends State<play> {
  @override
  late FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
        videoPlayerController:
        VideoPlayerController.networkUrl(Uri.parse('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),));
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor :Colors.black,

        leading:GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BotNavi()),
              );
            },
            child: Icon(Icons.arrow_back,color: Colors.white,)),
        actions: [
          Icon(Icons.file_download_outlined,color: Colors.white,),
          SizedBox(width: 20),
          Icon(Icons.search,color: Colors.white,)
        ],
      ),



      body: SingleChildScrollView(
        child: Column(
            children: [
              SizedBox(height: 230),
              //Video
              Container(
                height: 250,
                width: double.infinity,
                child: FlickVideoPlayer(
                    flickManager: flickManager
                ),
              ),
            ]
        ),
      ),
    );
  }
}
