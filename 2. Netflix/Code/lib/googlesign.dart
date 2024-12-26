import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:niranjanauth/phone.dart';
import 'package:niranjanauth/signup.dart';

import 'BotNavi.dart';
import 'firebase dart.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController a = TextEditingController(); //username (email)
  TextEditingController b = TextEditingController(); //password



  @override
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
                SizedBox(height: 80),
                Container(
                  height: 750,
                  width: 350,
                  color: Colors.black.withOpacity(0.6),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(width: 15),
                          Text(
                            "Sign In",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          )
                        ],
                      ), //SIGN IN TEXT
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
                                if (_formkey.currentState!.validate()) {

                                User? user = await FireAuth.signInUsingEmailPassword(
                                email: a.text, password: b.text, context: context);
                                if (user != null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Welcome')));
                                Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                builder: (context) => BotNavi()));
                                }
                                else{
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Invalid Email or Password')));
                                }
                                }
                                },
                          // if (_formkey.currentState!.validate()) {
                          //
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const BotNavi()),
                          //   );
                          // }

                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.red),
                        ),
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                          ),
                        ),
                      ), //Sign In button
                      SizedBox(height: 15),
                      Text("Dont have an account ?",style: TextStyle(color: Colors.white),),
                      SizedBox(height: 15,),
                      ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> signup()));
                      }, child: Text("Sign Up",style: TextStyle(color: Colors.black),)),
                      SizedBox(height: 20),
                      Text("Or else : ",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),


                      SizedBox(height: 20),
                      

                      // Google Sign-In Button
                      ElevatedButton(
                          onPressed: () async {
                            FirebaseAuth auth = await FirebaseAuth.instance;
                            try {
                              final GoogleSignInAccount? googleSignInAccount =
                              await GoogleSignIn(
                                clientId:
                                "118471401779-qg5apqpb71l42c57hj9dtep87u7frl52.apps.googleusercontent.com",
                              ).signIn();
                              final GoogleSignInAuthentication
                              googleSignInAuthentication =
                              await googleSignInAccount!.authentication;

                              final AuthCredential credential =
                              GoogleAuthProvider.credential(
                                accessToken: googleSignInAuthentication.accessToken,
                                idToken: googleSignInAuthentication.idToken,
                              );
                              auth.signInWithCredential(credential);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => BotNavi()));

// Use the user object for further operations or navigate to a new screen.
                            } catch (e) {
// print(e.toString());
                              Text("${e.toString()}");
                            }
                          },
                          child: Text("Sign in via Google")),
                      SizedBox(height: 21),
                      ElevatedButton(
                        onPressed: () {

                        Navigator.push(context,MaterialPageRoute(
                            builder: (context) =>  phone()
                        ));

                        },
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.white),
                        ),
                        child: Text(
                          'Sign In via phone number',

                        ),
                      ),
                      SizedBox(height: 59),
                        Row(
                          children: [

                            SizedBox(width: 70,),
                            Icon(Icons.warning,color: Colors.red,),
                            SizedBox(width: 10,),
                            Text("Alternative way : ",style: TextStyle(color: Colors.white,fontSize: 20),),


                          ],
                        ),

                      SizedBox(height: 20,),

                      ElevatedButton(
                        onPressed: () {

                        Navigator.push(context,MaterialPageRoute(
                            builder: (context) =>  BotNavi()
                        ));

                        },
                        style: ButtonStyle(

                          backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.red),
                        ),
                        child: Text("Can't sign in? Click here !!!",style: TextStyle(color: Colors.yellow),

                        ),
                      ),




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







