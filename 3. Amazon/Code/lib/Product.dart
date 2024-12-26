import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



List<String> list = <String>['Qty: 1', '2', '3', '4', '5','6','7','8','9','10'];

class product extends StatefulWidget {
  final int id;
  const product({super.key,required this.id});

  @override
  State<product> createState() => _productState();
}

class _productState extends State<product> {
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchdata();
  }

  var data={};
  fetchdata()async{
    final response=await http.get(Uri.parse(
        "https://fakestoreapi.com/products/${widget.id}"
    ));
    if(response.statusCode==200){
      setState(() {

        data=json.decode(response.body);
        print(data);

      });
    }
  }

  String dropdownValue = list.first;

  List a = [
    "assets/bottle.png",
    "assets/astro.png",
    "assets/bg.png",
    "assets/homepage.png",
    "assets/imposter.png",
    "assets/working.png",
  ];
  int cposition=0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFFA5E6D0),
                  Color(0xFF85DAE1),
                ],
              )
          ),
        ),
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
        color: Colors.white12,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Text("Visit The Wallet Store Store",style: TextStyle(color: Colors.blue),
                  ),
                  SizedBox(
                    height: 10,
                    width: 120,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("5.0"),
                  ),
                  RatingBar(
                    filledIcon: Icons.star,
                    emptyIcon: Icons.star_border,
                    onRatingChanged: (value) => debugPrint('$value'),
                    initialRating: 5,
                    maxRating: 5,
                    size: 15,
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 150,
                    width: 412,
                    child: Text(data["description"].toString()),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),


              ///Carousal slider
              Column(
                children: [
                  Stack(
                    children: [
                      CarouselSlider.builder(
                        options:  CarouselOptions(
                            height: 460,
                            enlargeCenterPage: true,
                            autoPlay: true,
                            aspectRatio: 16 / 9,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enableInfiniteScroll: true,
                            autoPlayAnimationDuration: Duration(milliseconds: 800),
                            viewportFraction: 1,
                            onPageChanged: (index, reason) {
                              setState(() {
                                cposition = index;
                              });
                            }
                        ),
                        itemCount: a.length,
                        itemBuilder: (BuildContext context, int index, int realIndex)
                        {
                          return data.isEmpty?CircularProgressIndicator():Container(
                            height: 400,
                            width: 412,
                            child: Column(
                              children: [
                                // Text(data["id"].toString()),
                                // Text(data["title"].toString()),
                                // Text(data["price"] .toString()),
                                // Text(data["description"].toString()),
                                // Text(data["category"].toString()),
                                Container(
                                  height: 400,
                                  width: 412,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(image: NetworkImage(data["image"]),fit: BoxFit.fill)
                                  ),

                                ),
                                // Text(data["rating"]  ["rate"].toString()),
                                // Text(data["rating"] ["count"].toString()),
                              ],
                            ),
                          );

                        },

                      ),
                      Positioned(
                        top: 1,
                        left: 20,
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage("assets/discount.png"),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom:1 ,
                        right: 10,
                        child: Row(
                          children: [

                            DotsIndicator(
                                position: cposition,
                                dotsCount: a.length

                            ),
                            SizedBox(
                              width: 80,
                            ),
                            Icon(CupertinoIcons.heart),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.share),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                ],
              ),






              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 20, color: Colors.white, ),
                        children: [
                          WidgetSpan(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.red,
                              ),
                              // Background color
                              padding: EdgeInsets.all(4.0), // Padding around the text
                              child: Text(
                                '  Limited time deal  ',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 20, color: Colors.red, ),
                      children: [
                        WidgetSpan(
                          child: Container(
                            child: Row(
                              children: [
                                Text(
                                  '-50%',
                                  style: TextStyle(color: Colors.red,fontSize: 50,),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(data["price"] .toString(),  style: TextStyle(color: Colors.black,fontSize: 50,),),



                              ],
                            ),

                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 20, color: Colors.red, ),
                  children: [
                    WidgetSpan(
                      child: Container(
                        child: Row(
                          children: [
                            Text("M.R.P : "),
                            Text(
                              '1,699',
                              style: TextStyle(
                                decoration : TextDecoration.lineThrough,
                                color: Colors.red,fontSize: 15,),
                            ),
                          ],
                        ),

                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text("EMI starts at Rs.293."),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Visit The Wallet Store Store",style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text("Inclusive of all taxes"),

                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text("Total : Rs.844",style: TextStyle(fontWeight: FontWeight.bold),),

                ],
              ),
              Row(
                children: [
                  Text("FREE delivery",style: TextStyle(color: Colors.blue),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Monday, 19 August",style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text("for Prime members",),
                ],
              ),
              Row(
                children: [
                  Text("Order within",
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("2 hrs 41 mins.",style: TextStyle(color: Colors.green),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Details",style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(CupertinoIcons.location_solid),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Deliver to Niranjan.M - Thanjavur 613504",style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("In stock",style: TextStyle(color: Colors.green),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),

                ],
              ),
              Column(
                children: [
                  Container(
                    height: 50,
                    width: 350,

                    child: Card(
                      elevation: 10,
                      child: ElevatedButton(
                        onPressed: (){}
                        , child: Text("Add to cart",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                        style:  ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 350,

                    child: Card(
                      elevation: 10,
                      child: ElevatedButton(
                        onPressed: (){}
                        , child: Text("Buy Now",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
                        style:  ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}

