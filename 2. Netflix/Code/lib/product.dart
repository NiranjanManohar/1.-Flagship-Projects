import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:niranjanauth/play.dart';
import 'package:readmore/readmore.dart';
import 'package:video_player/video_player.dart';

import 'BotNavi.dart';
class product extends StatefulWidget {
  const product({super.key});

  @override
  State<product> createState() => _productState();
}

class _productState extends State<product> {
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
            //Video
            Container(
              height: 250,
              width: double.infinity,
              child: FlickVideoPlayer(
                  flickManager: flickManager
              ),
            ),

            //TITLE
            SizedBox(height: 18,),
            Row(
              children: [
                SizedBox(width: 10,),
                Text("Vandinai Thedum Nyaanoru \nPoovin Mottu - By Niranjan",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.white),),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(width: 14,),
                Text("2024    U/A13+     4sec     HD",style: TextStyle(fontSize: 15,color: Colors.white),),
              ],
            ),

            //BUTTONS PLAY AND DOWNLOAD
            SizedBox(height: 14,),
            Padding(
              padding: const EdgeInsets.only(left: 8,right: 8),
              child: ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>play()));
              },
                style:  ElevatedButton.styleFrom(
                  backgroundColor:Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child:Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 135,),
                        Icon(Icons.play_arrow,color: Colors.black,),
                        Text("Play",style: TextStyle(color: Colors.black,fontSize:17,fontWeight: FontWeight.bold),)
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 8,right: 8),
              child: ElevatedButton(onPressed: (){},
                style:  ElevatedButton.styleFrom(
                  backgroundColor:Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child:Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 135,),
                        Icon(Icons.file_download_outlined,color: Colors.white,),
                        Text("Download",style: TextStyle(color: Colors.white,fontSize:17,fontWeight: FontWeight.bold),)
                      ],
                    )
                  ],
                ),
              ),
            ),

            //description
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ReadMoreText(
                "Benny, a curious bee, forms an unlikely friendship with Daisy, a beautiful but lonely flower. As the meadow faces a severe drought, Daisy begins to wither, and Benny sets out on a dangerous journey to find water. Along the way, he battles predators and tough conditions, determined to save his friend\n\nBuzzing Love is a heartwarming story of friendship, sacrifice, and the beauty of nature.",
                style: TextStyle(color: Colors.white),
                trimMode: TrimMode.Line,
                trimLines: 3,
                colorClickableText: Colors.red,
                trimCollapsedText: 'Show more',
                trimExpandedText: 'Show less',
                moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.green),
              ),
            ),























          ],
        ),
      ),

    );
  }
}
