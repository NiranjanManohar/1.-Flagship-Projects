import 'dart:convert';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:readmore/readmore.dart';

import 'Product.dart';



List<String> ascdes = <String>["Ascending","Descending"];

class amazon extends StatefulWidget {
  const amazon({super.key});

  @override
  State<amazon> createState() => _amazonState();
}




class _amazonState extends State<amazon> {
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchdata();
  }
  List data=[];
  void _sortData(String sortOrder) {
    if (sortOrder == "Ascending") {
      data.sort((a, b) => a["id"].compareTo(b["id"])); // Ascending order
    } else if (sortOrder == "Descending") {
      data.sort((a, b) => b["id"].compareTo(a["id"])); // Descending order
    }

  }

  fetchdata()async{
    final response=await http.get(Uri.parse(
        "https://fakestoreapi.com/products"
    ));
    if(response.statusCode==200){
      setState(() {
        data=json.decode(response.body);
        _sortData(dropdownValue); // Sort the data after fetching
      });
    }
  }


  String dropdownValue = ascdes.first;
  int cposition=0;

  List a = [
    "assets/astro.png",
    "assets/bg.png",
    "assets/homepage.png",
    "assets/imposter.png",
    "assets/working.png",
  ];
  List b =[
    "Mobiles"
        "Fashion"
        "Prime"
        "Deals"
        "miniTV"
  ];
  List c= [
    "assets/astro.png",
    "assets/bg.png",
    "assets/homepage.png",
    "assets/imposter.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title:ClipRect(
          clipBehavior: Clip.hardEdge,
          child: Container(
            height: 48,
            width: 500,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                suffixIcon: Container(
                  width: 60,
                  child: Row(
                    children: [
                      Icon(Icons.document_scanner_outlined),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Icon(Icons.mic),
                      ),
                    ],
                  ),
                ) ,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Search Amazon.in",
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Icon(Icons.qr_code),
          ),
        ],
      ),
      body:

      Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white10,
        child: SingleChildScrollView(
          child: Column(
            children: [



              Container(
                height: 30,
                width: 412,
                color: Colors.lightBlueAccent,
                child: Row(
                  children: [
                    Icon(Icons.gps_fixed),
                    Text("  Deliver to Niranjan.M - Thanjavur 613504"),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),//Deliver to
              SizedBox(height: 20,),

              Container(
                height: 100,
                child: ListView.builder(
                  itemCount: data.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return data.isEmpty ? CircularProgressIndicator() : GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => product(id: data[index]["id"])));
                      },
                      child: Container(
                        width: 80, // Ensure consistent width
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center, // Align items centrally
                          crossAxisAlignment: CrossAxisAlignment.center, // Align horizontally centered
                          children: [
                            Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: NetworkImage(data[index]["image"])),
                              ),
                            ),

                            // Display the title
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0,left: 5,right: 5), // Add padding if necessary
                              child: Text(data[index]["title"].toString(),

                                textAlign: TextAlign.center, // Ensure text is centered
                                style: TextStyle(fontSize: 14), // Adjust font size if needed
                                overflow: TextOverflow.ellipsis, // Prevent overflow of long titles
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),//L


              Container(
                height: 200,
                child: CarouselSlider.builder(
                  options:  CarouselOptions(
                    height: 200.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 1,
                  ),
                  itemCount: a.length,
                  itemBuilder: (BuildContext context, int index, int realIndex)
                  {
                    return data.isEmpty?CircularProgressIndicator():GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> product(id:data[index]["id"]) ));
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center, // Align items centrally
                          crossAxisAlignment: CrossAxisAlignment.center, // Align horizontally centered
                          children: [
                            // Text(data[index]["id"].toString()),
                            // Text(data[index]["title"].toString()),
                            // Text(data[index]["price"] .toString()),
                            // Text(data[index]["description"].toString()),
                            // Text(data[index]["category"].toString()),


                            Container(
                              height: 120,
                              width: 200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(image: NetworkImage(data[index]["image"]),
                                      fit: BoxFit.fill)
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0,left: 5,right: 5), // Add padding if necessary
                              child: Text(
                                data[index]["title"].toString(),
                                textAlign: TextAlign.center, // Ensure text is centered
                                style: TextStyle(fontSize: 14), // Adjust font size if needed
                                overflow: TextOverflow.ellipsis, // Prevent overflow of long titles
                                maxLines: 2,
                              ),
                            ),


                            // Text(data[index]["rating"]  ["rate"].toString()),
                            // Text(data[index]["rating"] ["count"].toString()),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),



              Container(
                height: 180,
                child: ListView.builder(
                  itemCount: data.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return data.isEmpty ? CircularProgressIndicator() : GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => product(id: data[index]["id"])));
                      },
                      child: Container(
                        width: 120, // Ensure consistent width
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center, // Align items centrally
                          crossAxisAlignment: CrossAxisAlignment.center, // Align horizontally centered
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: NetworkImage(data[index]["image"])),
                              ),
                            ),

                            // Display the title
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0,left: 5,right: 5), // Add padding if necessary
                              child: Text(
                                data[index]["title"].toString(),
                                textAlign: TextAlign.center, // Ensure text is centered
                                style: TextStyle(fontSize: 14), // Adjust font size if needed
                                overflow: TextOverflow.ellipsis, // Prevent overflow of long titles
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),


              DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(height: 20,),
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    dropdownValue = value!;
                    _sortData(dropdownValue); // Sort the data after fetching
                  });
                },
                items: ascdes.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child:Column(
                    children: [
                      Row(
                        children: [
                          Text("Top deals to discover",textAlign:TextAlign.left,style: TextStyle(fontSize: 30,fontFamily: AutofillHints.familyName),),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20)
                ),
                child: GridView.builder(
                    primary: false,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: c.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (BuildContext context, int index)
                    {
                      return data.isEmpty?CircularProgressIndicator():GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> product(id:data[index]["id"]) ));
                        },
                        child: Container(
                          width: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Text(data[index]["id"].toString()),
                              // Text(data[index]["title"].toString()),
                              // Text(data[index]["price"] .toString()),
                              // Text(data[index]["description"].toString()),
                              // Text(data[index]["category"].toString()),


                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    image: DecorationImage(image: NetworkImage(data[index]["image"]))
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0,left: 5,right: 5), // Add padding if necessary
                                child: Text(
                                  data[index]["title"].toString(),
                                  textAlign: TextAlign.center, // Ensure text is centered
                                  style: TextStyle(fontSize: 14), // Adjust font size if needed
                                  overflow: TextOverflow.ellipsis, // Prevent overflow of long titles
                                  maxLines: 2,
                                ),
                              ),


                              // Text(data[index]["rating"]  ["rate"].toString()),
                              // Text(data[index]["rating"] ["count"].toString()),
                            ],
                          ),
                        ),
                      );

                    }
                ),
              ),
              SizedBox(height: 20,),

              ReadMoreText(
                'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                trimMode: TrimMode.Line,
                trimLines: 2,
                colorClickableText: Colors.red,
                trimCollapsedText: 'Show more',
                trimExpandedText: 'Show less',
                moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
