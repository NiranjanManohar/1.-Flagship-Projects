import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:niranjanauth/product.dart';

import 'BotNavi.dart';
class tvshowslider extends StatefulWidget {
  const tvshowslider({super.key,});

  @override
  State<tvshowslider> createState() => _moviesState();
}

class _moviesState extends State<tvshowslider> {
  @override
  List tvshows =
  [
    "assets/breakingbad.png",
    "assets/gameofthrones.png",
    "assets/moneyheist.png",
    "assets/peakyblinders.png",
    "assets/howimetyourmother.png",
    "assets/theboys.png",
    "assets/strangerthings.png",
    "assets/friends.png",
    "assets/theoffice.png",
    "assets/bettercallsaul.png",
  ];
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

      body : Column(
        children: [
          SizedBox(height: 10),
          Text("Top Tv shows for you",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),

          GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const product()),
              );
            },
            child: Container(
              height: 590,
              width: 412,
              child: CarouselSlider.builder(
                options:  CarouselOptions(
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 9 / 16,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 1,
                ),
                itemCount: tvshows.length,
                itemBuilder: (BuildContext context, int index, int realIndex)
                {
                  return Container(
                    height: 500,
                    width: 370,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(image: AssetImage(tvshows[index]),
                          fit: BoxFit.fill ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
