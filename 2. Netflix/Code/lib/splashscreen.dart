import 'dart:async';
import 'package:flutter/material.dart';
import 'package:niranjanauth/googlesign.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  login()),
      );
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(height: 175,),
          Container(
            height: 550,
            width: 650,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(image: AssetImage("assets/netflixlogo.png"),
                  fit: BoxFit.fill ),
            ),
          ),
        ],
      ),





    );
  }
}
