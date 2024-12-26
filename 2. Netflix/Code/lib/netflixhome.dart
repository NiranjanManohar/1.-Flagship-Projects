import 'package:flutter/material.dart';
import 'package:niranjanauth/Stay%20tuned.dart';
import 'package:niranjanauth/play.dart';
import 'package:niranjanauth/product.dart';
import 'package:niranjanauth/tvshows.dart';

import 'mixture.dart';
import 'movies.dart';
class netflixhome extends StatefulWidget {
  const netflixhome({super.key});

  @override
  State<netflixhome> createState() => _netflixhomeState();
}

class _netflixhomeState extends State<netflixhome> {
  @override
  bool isDarkMode = true;
  bool _isSearching = false;

  TextEditingController _searchController = TextEditingController();

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
    });
  }



  List movies =
  [
    "assets/goat.png",
    "assets/vidamuyarchi.png",
    "assets/nayakan.png",
    "assets/pariyerum.png",
    "assets/anbesivam.png",
    "assets/96.png",
    "assets/anniyan.png",
    "assets/vadachennai.png",
    "assets/aayirathil.png",
    "assets/maharaja.png",
  ];

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

  List anime =
  [
    "assets/aot.png",
    "assets/vinlandsaga.png",
    "assets/onepiece.png",
    "assets/dragonballz.png",
    "assets/demonslayer.png",
    "assets/naruto.png",
    "assets/gintama.png",
    "assets/kon.png",
    "assets/berserk.png",
    "assets/dailylives.png",
  ];

  List mix1 =
  [
    "assets/vinlandsaga.png",
    "assets/breakingbad.png",
    "assets/howimetyourmother.png",
    "assets/onepiece.png",
    "assets/theboys.png",
    "assets/anbesivam.png",
    "assets/friends.png",
    "assets/vidamuyarchi.png",
    "assets/naruto.png",
    "assets/gameofthrones.png",
  ];
  List mix2 =
  [
    "assets/strangerthings.png",
    "assets/dragonballz.png",
    "assets/pariyerum.png",
    "assets/nayakan.png",
    "assets/vadachennai.png",
    "assets/kon.png",
    "assets/96.png",
    "assets/peakyblinders.png",
    "assets/vinlandsaga.png",
    "assets/demonslayer.png",
  ];
  List mix3 =
  [
    "assets/anniyan.png",
    "assets/maharaja.png",
    "assets/bettercallsaul.png",
    "assets/theoffice.png",
    "assets/berserk.png",
    "assets/aayirathil.png",
    "assets/dailylives.png",
    "assets/moneyheist.png",
    "assets/gintama.png",
    "assets/aot.png",

  ];
  List mixture = [
    "assets/vinlandsaga.png",
    "assets/breakingbad.png",
    "assets/howimetyourmother.png",
    "assets/onepiece.png",
    "assets/theboys.png",
    "assets/anbesivam.png",
    "assets/friends.png",
    "assets/vidamuyarchi.png",
    "assets/naruto.png",
    "assets/gameofthrones.png",
    "assets/strangerthings.png",
    "assets/dragonballz.png",
    "assets/pariyerum.png",
    "assets/nayakan.png",
    "assets/vadachennai.png",
    "assets/kon.png",
    "assets/96.png",
    "assets/peakyblinders.png",
    "assets/demonslayer.png",
    "assets/anniyan.png",
    "assets/maharaja.png",
    "assets/bettercallsaul.png",
    "assets/theoffice.png",
    "assets/berserk.png",
    "assets/aayirathil.png",
    "assets/dailylives.png",
    "assets/moneyheist.png",
    "assets/gintama.png",
    "assets/aot.png",
  ];
  categories(){
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: Colors.black.withOpacity(0.7),
        title: Text('Movie Genres',style: TextStyle(color: Colors.white)),
        content: Container(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  mixtureslider()),
                      );
                    },
                    child: Text('Action\n\nSci-fi\n\nComedy\n\nDrama\n\nFantasy\n\nHorrow\n\nRomance\n\nThriller',
                        style: TextStyle(color: Colors.white,fontSize: 15)),
                  ),
                ),

              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            child: Text('Close', style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }


  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor :Color(0xFF303A53),
          leading: Image(image: AssetImage("assets/netflixlogo.png"),),
          title:
          Column(
            children: [
              _isSearching
                  ? TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 10),
                ),
                style: TextStyle(color: Colors.white),
              )
                  :Text("Niranjan's Netflix",style: TextStyle(color: Colors.white),),


            ],
          ),
          actions: [
            GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ComingSoonPage()));
                },
                child: Icon(Icons.file_download_outlined,color: Colors.white,)),
            SizedBox(width: 20),
            IconButton(
              icon: Icon(Icons.search,color: Colors.white,),
              onPressed: _toggleSearch,
            ),
          ],
        ),


        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF303A53),
                  Colors.black,
                ]),
          ),




          child: SingleChildScrollView(
            child: Column(
              children: [


                // First intro
                SizedBox(height: 15,),
                // TVSHOWS, MOvies.....
                Row(
                  children: [
                    SizedBox(width: 10,),
                    ElevatedButton(onPressed: (){
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context)=> tvshowslider(),
                        ),
                      );
                    },
                        style:  ElevatedButton.styleFrom(
                          backgroundColor:Color(0xFF303A53),
                          side: BorderSide(
                            color: Colors.white,
                          ),                  ),

                        child: Text("Tv shows",style: TextStyle(color: Colors.white),)),
                    SizedBox(width: 15,),
                    ElevatedButton(onPressed: (){
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context)=> movieslider(),
                        ),
                      );

                    },
                        style:  ElevatedButton.styleFrom(
                          backgroundColor:Color(0xFF303A53),
                          side: BorderSide(
                            color: Colors.white,
                          ),                  ),

                        child: Text("Movies",style: TextStyle(color: Colors.white),)),
                    SizedBox(width: 15,),
                    ElevatedButton(onPressed: (){
                      categories();
                    },
                        style:  ElevatedButton.styleFrom(
                          backgroundColor:Color(0xFF303A53),
                          side: BorderSide(
                            color: Colors.white,
                          ),                  ),

                        child: Text("Categories",style: TextStyle(color: Colors.white),)),
                  ],
                ),
                SizedBox(height: 25,),
                ////BIG IMAGE
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const product()),
                    );
                  },
                  child: Container(
                    height: 500,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(image: AssetImage("assets/strangerthings.png"),
                          fit: BoxFit.fill),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 440,),
                        Row(
                          children: [
                            SizedBox(width: 55,),
                            ElevatedButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>play()));
                            },
                              style:  ElevatedButton.styleFrom(
                                backgroundColor:Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                side: BorderSide(
                                  color: Colors.white,
                                ),                  ),

                              child:Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.play_arrow,color: Colors.black,),
                                      Text("Play",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(width: 27,),
                            ElevatedButton(onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  mixtureslider()),
                              );
                            },
                              style:  ElevatedButton.styleFrom(
                                backgroundColor:Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                side: BorderSide(
                                  color: Colors.white,
                                ),                  ),

                              child:Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.add,color: Colors.black,),
                                      Text("MyList",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                                    ],
                                  )
                                ],
                              ),
                            ),

                          ],
                        )
                      ],
                    ),
                  ),
                ),


                //Razw pack TOP MOVIES
                SizedBox(height: 17),
                Row(
                  children: [
                    SizedBox(width: 10,),
                    Text("Top Movies",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const product()),
                    );
                  },
                  child: Container(
                    height: 160,
                    child: ListView.builder(
                        itemCount: movies.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index)
                        {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                GestureDetector(
                                  // onTap: (){
                                  //   Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(builder: (context) => const product()),
                                  //   );
                                  // },
                                  child: Container(
                                    height: 120,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(image: AssetImage(movies[index]),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 3),
                                // Text(movienames[index],style: TextStyle(color: Colors.white),
                                //   overflow: TextOverflow.ellipsis, // This will handle overflow
                                //   maxLines: 2,),
                              ],
                            ),
                          );
                        }
                    ),
                  ),
                ),


                //OG PACK STARTS HERE  TOP TV SHOWS
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(width: 10,),
                    Text("Top TV Shows",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const product()),
                    );
                  },
                  child: Container(
                    height: 160,
                    child: ListView.builder(
                        itemCount: tvshows.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index)
                        {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                GestureDetector(
                                  // onTap: (){
                                  //   Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(builder: (context) => const product()),
                                  //   );
                                  // },
                                  child: Container(
                                    height: 120,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(image: AssetImage(tvshows[index]),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 3),
                                // Text(tvshownames[index],style: TextStyle(color: Colors.white), overflow: TextOverflow.ellipsis, // This will handle overflow
                                //   maxLines: 2,),
                              ],
                            ),
                          );
                        }
                    ),
                  ),
                ),


                //aNIME
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(width: 10,),
                    Text("Top Anime",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const product()),
                    );
                  },
                  child: Container(
                    height: 160,
                    child: ListView.builder(
                        itemCount: anime.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index)
                        {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                GestureDetector(
                                  // onTap: (){
                                  //   Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(builder: (context) => const product()),
                                  //   );
                                  // },
                                  child: Container(
                                    height: 120,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(image: AssetImage(anime[index]),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 3),
                                // Text(animenames[index],style: TextStyle(color: Colors.white), overflow: TextOverflow.ellipsis, // This will handle overflow
                                //   maxLines: 2,),
                              ],
                            ),
                          );
                        }
                    ),
                  ),
                ),


                //large size one
                SizedBox(height: 20),
                Row(
                  children: [
                    SizedBox(width: 10,),
                    Text("Loved by All <3  ",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const product()),
                    );
                  },
                  child: Container(
                    height: 250,
                    child: ListView.builder(
                        itemCount: mix1.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index)
                        {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                GestureDetector(
                                  // onTap: (){
                                  //   Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(builder: (context) => const product()),
                                  //   );
                                  // },
                                  child: Container(
                                    height: 200,
                                    width: 130,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(image: AssetImage(mix1[index]),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          );
                        }
                    ),
                  ),
                ),


                //Extras 1
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(width: 10,),
                    Text("Top Searches",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const product()),
                    );
                  },
                  child: Container(
                    height: 160,
                    child: ListView.builder(
                        itemCount: mix2.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index)
                        {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                GestureDetector(
                                  // onTap: (){
                                  //   Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(builder: (context) => const product()),
                                  //   );
                                  // },
                                  child: Container(
                                    height: 120,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(image: AssetImage(mix2[index]),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 3),
                              ],
                            ),
                          );
                        }
                    ),
                  ),
                ),


                //Extras 2
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(width: 10,),
                    Text("The Epics",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const product()),
                    );
                  },
                  child: Container(
                    height: 160,
                    child: ListView.builder(
                        itemCount: mix3.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index)
                        {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                GestureDetector(
                                  // onTap: (){
                                  //   Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(builder: (context) => const product()),
                                  //   );
                                  // },
                                  child: Container(
                                    height: 120,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(image: AssetImage(mix3[index]),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 3),
                              ],
                            ),
                          );
                        }
                    ),
                  ),
                ),


                //Extras 3
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(width: 10,),
                    Text("Top Anime",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const product()),
                    );
                  },
                  child: Container(
                    height: 160,
                    child: ListView.builder(
                        itemCount: anime.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index)
                        {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                GestureDetector(
                                  // onTap: (){
                                  //   Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(builder: (context) => const product()),
                                  //   );
                                  // },
                                  child: Container(
                                    height: 120,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(image: AssetImage(anime[index]),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 3),
                              ],
                            ),
                          );
                        }
                    ),
                  ),
                ),


                //// DUPLICATES
                //Extras 1
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(width: 10,),
                    Text("Bingeworthy",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const product()),
                    );
                  },
                  child: Container(
                    height: 160,
                    child: ListView.builder(
                        itemCount: mix2.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index)
                        {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                GestureDetector(
                                  // onTap: (){
                                  //   Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(builder: (context) => const product()),
                                  //   );
                                  // },
                                  child: Container(
                                    height: 120,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(image: AssetImage(mix2[index]),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 3),
                              ],
                            ),
                          );
                        }
                    ),
                  ),
                ),


                //Extras 2
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(width: 10,),
                    Text("Weekends",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const product()),
                    );
                  },
                  child: Container(
                    height: 160,
                    child: ListView.builder(
                        itemCount: mix3.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index)
                        {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                GestureDetector(
                                  // onTap: (){
                                  //   Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(builder: (context) => const product()),
                                  //   );
                                  // },
                                  child: Container(
                                    height: 120,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(image: AssetImage(mix3[index]),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 3),
                              ],
                            ),
                          );
                        }
                    ),
                  ),
                ),


                //Extras 3
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(width: 10,),
                    Text("Random",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const product()),
                    );
                  },
                  child: Container(
                    height: 160,
                    child: ListView.builder(
                        itemCount: anime.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index)
                        {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                GestureDetector(
                                  // onTap: (){
                                  //   Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(builder: (context) => const product()),
                                  //   );
                                  // },
                                  child: Container(
                                    height: 120,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(image: AssetImage(anime[index]),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 3),
                              ],
                            ),
                          );
                        }
                    ),
                  ),
                ),








              ],
            ),
          ),
        ),
      ),
    );
  }
}
