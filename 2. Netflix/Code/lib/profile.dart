import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:niranjanauth/product.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'BotNavi.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  String defaultname = "Niranjan";
  TextEditingController a = TextEditingController(text: "Niranjan");
  File? selectedImage;
  String? imagepath;

  @override
  void initState() {
    super.initState();
    _loadProfileData();  // Load saved data on startup
  }

  Future<void> _loadProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      defaultname = prefs.getString('name') ?? "Niranjan";
      imagepath = prefs.getString('imagePath');
      if (imagepath != null) {
        selectedImage = File(imagepath!);
      }
      a.text = defaultname;
    });
  }

  Future<void> _saveProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', defaultname);
    if (imagepath != null) {
      prefs.setString('imagePath', imagepath!);
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
        imagepath = pickedFile.path;  // Store the path of the selected image
      });
      _saveProfileData();  // Save the selected image path
    }
  }

  List<String> one = [
    "assets/nayakan.png",
    "assets/pariyerum.png",
    "assets/anbesivam.png",
    "assets/theboys.png",
    "assets/strangerthings.png",
    "assets/vinlandsaga.png",
    "assets/onepiece.png",
  ];

  List<String> two = [
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

  void update() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Name'),
          content: TextField(
            controller: a,
            decoration: InputDecoration(hintText: 'Enter new name'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog without saving
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                setState(() {
                  defaultname = a.text; // Update the text with new value
                });
                _saveProfileData();  // Save the updated name
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => BotNavi()));
          },
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text("My Netflix", style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold)),
        actions: [
          Icon(Icons.search, color: Colors.white),
          SizedBox(width: 20),
          Icon(Icons.menu, color: Colors.white),
        ],
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                height: 200, // Fixed height to avoid overflow
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: selectedImage == null
                      ? DecorationImage(image: AssetImage("assets/luffy.png"), fit: BoxFit.cover) // Use BoxFit.cover to fill space
                      : DecorationImage(image: FileImage(selectedImage!), fit: BoxFit.cover), // Updated to FileImage
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: update,
              child: Text(defaultname, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25)),
            ),


            SizedBox(height: 45),
            Row(
              children: [
                SizedBox(width: 10),
                Text("Recently watched", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const product()));
              },
              child: Container(
                height: 160,
                child: ListView.builder(
                  itemCount: one.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            child: Container(
                              height: 120,
                              width: 90,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(one[index]), fit: BoxFit.fill),
                              ),
                            ),
                          ),
                          SizedBox(height: 3),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            // Extras 2
            Row(
              children: [
                SizedBox(width: 10),
                Text("Favourites", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const product()));
              },
              child: Container(
                height: 160,
                child: ListView.builder(
                  itemCount: two.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            child: Container(
                              height: 120,
                              width: 90,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(two[index]), fit: BoxFit.fill),
                              ),
                            ),
                          ),
                          SizedBox(height: 3),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
