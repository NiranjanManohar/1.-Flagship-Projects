import 'package:flutter/material.dart';
import 'package:niranjanauth/profile.dart';
import 'package:niranjanauth/tvshows.dart';

import 'anime.dart';
import 'movies.dart';
import 'netflixhome.dart';

class BotNavi extends StatefulWidget {
  const BotNavi({super.key});

  @override
  State<BotNavi> createState() => _BotNaviState();
}

class _BotNaviState extends State<BotNavi> {

  int _index = 0;

  final pages = [
    netflixhome(),
    movieslider(),
    tvshowslider(),
    animeslider(),
    profile(),
  ];


  tap(index)
  {
    setState(() {
      _index = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: "Home",backgroundColor: Colors.black),
          BottomNavigationBarItem(icon: Icon(Icons.movie_creation_outlined),label: "Movies",backgroundColor: Colors.black),
          BottomNavigationBarItem(icon: Icon(Icons.live_tv),label: "Tv shows",backgroundColor: Colors.black),
          BottomNavigationBarItem(icon: Icon(Icons. hotel_class),label: "Anime",backgroundColor: Colors.black),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile",backgroundColor: Colors.black
          ),
        ],
        currentIndex: _index,
        onTap: tap,
      ),
    );
  }
}


