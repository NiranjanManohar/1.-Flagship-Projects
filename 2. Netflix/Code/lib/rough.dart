import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'BotNavi.dart';

class crt extends StatefulWidget {
  const crt({super.key});

  @override
  State<crt> createState() => _crtState();
}

class _crtState extends State<crt> {
  final email=TextEditingController();
  final name=TextEditingController();
  final pass=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOTSTAR"),
        actions: [
          Text("HELP"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder:(context)=> BotNavi()));
                },
                child: Text("SIGN IN")),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: name,
              decoration: InputDecoration(
                  hintText: "USer Name",
                  border: OutlineInputBorder()
              ),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: email,
              decoration: InputDecoration(
                  hintText: "Email or Phone Number",
                  border: OutlineInputBorder()
              ),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: pass,
              decoration: InputDecoration(
                  label: Text("create password"),
                  border: OutlineInputBorder()
              ),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: () async {
              try {
                UserCredential userCredential = await FirebaseAuth
                    .instance
                    .createUserWithEmailAndPassword(
                  email: email.text,
                  password:pass.text,
                );
                User?user = userCredential.user;
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BotNavi()));

              }
              catch (e){
                print(e);
              }

            }, child:Text("CREATE ACCOUNT")),
          )
        ],
      ),

    );
  }
}