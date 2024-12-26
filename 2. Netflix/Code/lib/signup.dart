import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'BotNavi.dart';
class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  @override
  final _formkey = GlobalKey<FormState>();
  TextEditingController a = TextEditingController(); //username (email)
  TextEditingController b = TextEditingController(); //password


  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg1.png"),
            fit: BoxFit.fill,
            opacity: 0.65,
          ),
        ),
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 250),
                Container(
                  height: 400,
                  width: 350,
                  color: Colors.black.withOpacity(0.6),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(width: 15),
                          Text(
                            "Sign Up",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          )
                        ],
                      ), //SIGN UP TEXT
                      SizedBox(height: 30),
                      Container(
                        height: 50,
                        width: 300,
                        child: TextFormField(
                          controller: a,
                          onChanged: (value) {
                          },
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                              return 'Please enter an email address';
                            }
                          },
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            hintText: "Enter Email Address",
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                      ), //Email
                      SizedBox(height: 40),
                      Container(
                        height: 50,
                        width: 300,
                        child: TextFormField(
                          controller: b,
                          onChanged: (value) {
                          },
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                    .hasMatch(value)) {
                              return 'Please enter Password';
                            }
                          },
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            hintText: "Enter Password",
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                      ), //password
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () async {
                          try {
                            UserCredential userCredential = await FirebaseAuth
                                .instance
                                .createUserWithEmailAndPassword(
                              email: a.text,
                              password:b.text,
                            );
                            User?user = userCredential.user;
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) =>
                                    BotNavi()));

                          }
                          catch (e){
                            print(e);
                          }


                          if (_formkey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Welcome')));
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BotNavi()),
                            );
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.red),
                        ),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                          ),
                        ),
                      ), //Sign In button





                    ],
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
