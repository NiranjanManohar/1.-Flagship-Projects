import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'Forgot Password.dart';
import 'Sign up.dart';



//
// class Login extends StatefulWidget {
//   const Login({super.key});
//
//   @override
//   State<Login> createState() => _LoginState();
// }
//
// class _LoginState extends State<Login> {
//   bool _obscureText = true;
//   void _passwordVisibility() {
//     setState(() {
//       _obscureText = !_obscureText;
//     });
//   }
//
//   TextEditingController email = TextEditingController();
//   //TextEditingController password = TextEditingController();
//   TextEditingController tx1 = TextEditingController();
//   TextEditingController tx2 = TextEditingController();
//   TextEditingController tx3 = TextEditingController();
//   TextEditingController tx4 = TextEditingController();
//   TextEditingController tx5 = TextEditingController();
//   TextEditingController tx6 = TextEditingController();
//
//   Widget text(BuildContext context,TextEditingController controller){
//     return Container(
//       child: SizedBox(
//         height: 50,width: 40,
//         child: TextFormField(decoration: InputDecoration(
//           filled: true,
//           border: OutlineInputBorder(),
//         ),
//           // maxLength: 1,
//           controller: controller,
//           textAlign: TextAlign.center,
//           // keyboardType: TextInputType.number,
//           style: TextStyle(fontSize: 20),
//           onChanged: (value){
//             if (value.length == 1){
//               FocusScope.of(context).nextFocus();
//             }
//           },
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue.shade50,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               ShaderMask(
//                 shaderCallback: (Rect bounds) {
//                   return LinearGradient(
//                     colors: [Colors.cyan, Colors.blueAccent],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ).createShader(bounds);
//                 },
//                 child: Text(
//                   "Curio",
//                   style: TextStyle(
//                     fontSize: 50,
//                     fontWeight: FontWeight.bold,
//                     foreground: Paint()
//                       ..style = PaintingStyle.stroke
//                       ..strokeWidth = 2.0
//                       ..shader = LinearGradient(
//                         colors: [Colors.cyan, Colors.blueAccent],
//                       ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
//                     shadows: [
//                       Shadow(
//                         offset: Offset(4.0, 4.0),
//                         blurRadius: 8.0,
//                         color: Colors.grey.withOpacity(0.4),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Text("Campus", style: TextStyle(fontSize: 50, fontWeight: FontWeight.w600, color: Colors.deepOrange, letterSpacing: 1.5,
//                 shadows: [
//                   Shadow(
//                     offset: Offset(3.0, 3.0),
//                     blurRadius: 6.0,
//                     color: Colors.black38,
//                   ),
//                   Shadow(
//                     offset: Offset(-3.0, -3.0),
//                     blurRadius: 6.0,
//                     color: Colors.orangeAccent.withOpacity(0.2),
//                   ),
//                 ],
//               ),
//               ),
//               Center(
//                 child: Container(
//                   height: 470,
//                   width: 320,
//                   decoration: BoxDecoration(
//                       color: Colors.grey.shade400,
//                       borderRadius: BorderRadius.circular(20)),
//                   child: Column(
//                     children: [
//                       Align(
//                         alignment: Alignment.topLeft,
//                         child: Padding(
//                           padding: const EdgeInsets.only(top: 30, left: 10),
//                           child: Text("Username", style: TextStyle(fontSize: 20, color: Colors.black),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(right: 15, left: 15),
//                         child: TextFormField(
//                           obscureText: _obscureText,
//                           controller: email,
//                           decoration: InputDecoration(
//                             filled: true,
//                             border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
//                             hintText: "Username",
//                           ),
//                         ),
//                       ),
//                       Align(
//                         alignment: Alignment.topLeft,
//                         child: Padding(
//                           padding: const EdgeInsets.only(top: 20, left: 10),
//                           child: Text("Password", style: TextStyle(fontSize: 20, color: Colors.black),
//                           ),
//                         ),
//                       ),
//                       Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           text(context, tx1),
//                           text(context, tx2),
//                           text(context, tx3),
//                           text(context, tx4),
//                           text(context, tx5),
//                           text(context, tx6),
//                         ],
//                       ),
//                       Align(
//                         alignment: Alignment.topRight,
//                         child: Padding(
//                           padding: const EdgeInsets.only(
//                             right: 8,
//                           ),
//                           child: TextButton(
//                               onPressed: () {
//                                 Navigator.push(context, MaterialPageRoute(builder: (context) => FP()));
//                               },
//                               child: RichText(
//                                 text: TextSpan(
//                                   text: "Forgot password?",
//                                   style: TextStyle(
//                                       color: Color.fromRGBO(222, 77, 33,1), // Color of the text
//                                       decoration: TextDecoration.underline // No default underline
//                                   ),
//                                 ),
//                               )),
//                         ),
//                       ),
//                       ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue.shade500,
//                           minimumSize: Size(300, 50),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8.0), // Set the radius for rounded corners
//                           ),
//                           padding: EdgeInsets.symmetric(horizontal: 16.0), // Padding inside the button
//                         ),
//                         child: Text("Login", style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                       SizedBox(height: 10,),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text("Don't have an account?", style: TextStyle(color: Colors.black),),
//                           GestureDetector(onTap:() {
//                             Navigator.push(context, MaterialPageRoute(builder: (context)=>signup()));
//                           },child: Text(" Signup", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold,),)),
//                         ],
//                       ),
//                       SizedBox(height: 16.0),
//                       RichText(
//                         text: TextSpan(text: "Or ", style: TextStyle(color: Colors.black),
//                           children: [
//                             TextSpan(
//                               text: "With", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,
//                             ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: 10,),
//                       Container(
//                         height: 50,
//                         width: 300,
//                         // color: Colors.black,
//                         child: Row(
//                           children: [
//                             SizedBox(width: 50,),
//                             Image.network("https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png",
//                               height: 50, // Adjust the size of the icon
//                               width: 50, // Adjust the size of the icon
//                             ),
//                             Text("Sign in with Google", style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class ForgotPassword extends StatefulWidget {
//   const ForgotPassword({super.key});
//
//   @override
//   State<ForgotPassword> createState() => _ForgotPasswordState();
// }
//
// class _ForgotPasswordState extends State<ForgotPassword> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _obscureText = true;
//
//   void _togglePasswordVisibility() {
//     setState(() {
//       _obscureText = !_obscureText;
//     });
//   }
//
//   void _resetPassword() {
//     final String email = _emailController.text;
//     final String newPassword = _passwordController.text;
//
//     if (email.isNotEmpty && newPassword.isNotEmpty) {
//       // Perform reset password action
//       print(
//           'Reset password request sent for email: $email with new password: $newPassword');
//       // Replace the print statement with your reset logic
//     } else {
//       print('Please fill in both email and new password fields');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color(0xFFFFFFFF),
//               Color(0xFF41B7ED),
//             ],
//           ),
//         ),
//         child: Center(
//           child: Material(
//             elevation: 10,
//             borderRadius: BorderRadius.circular(20),
//             child: Container(
//               height: 450,
//               width: 320,
//               decoration: BoxDecoration(
//                   color: Colors.white, borderRadius: BorderRadius.circular(20)),
//               child: SafeArea(
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Enter your email address and a new password to reset it',
//                         style: TextStyle(fontSize: 16.0),
//                       ),
//                       SizedBox(height: 20.0),
//                       TextFormField(
//                         controller: _emailController,
//                         decoration: InputDecoration(
//                           labelText: 'Email',
//                           border: OutlineInputBorder(),
//                         ),
//                       ),
//                       SizedBox(height: 20.0),
//                       TextFormField(
//                         controller: _passwordController,
//                         obscureText: _obscureText,
//                         decoration: InputDecoration(
//                           labelText: 'New Password',
//                           border: OutlineInputBorder(),
//                           suffixIcon: IconButton(
//                             icon: Icon(
//                               _obscureText
//                                   ? Icons.visibility
//                                   : Icons.visibility_off,
//                             ),
//                             onPressed: _togglePasswordVisibility,
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 20.0),
//                       ElevatedButton(
//                         onPressed:(){
//                           _resetPassword();
//                           // Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.black,
//                           minimumSize: Size(double.infinity, 50),
//                         ),
//                         child: Text('Reset Password',
//                             style: TextStyle(color: Colors.white)),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// ElevatedButton
// (
// style: ElevatedButton.styleFrom(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(10),
// ),
// backgroundColor: sinupbutton),
// onPressed: () {
// showDialog(
// context: context,
// builder: (BuildContext context) {
// return AlertDialog(
// backgroundColor: Colors.white, // Clean background
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(15.0), // Soft rounded corners
// ),
// elevation: 8, // Soft shadow effect
// title: Text(
// "Are you sure you want to Logout?",
// style: GoogleFonts.poppins(
// color: Colors.black87, // Subtle color for text
// fontSize: 20,
// fontWeight: FontWeight.w600, // Medium weight for the title
// ),
// ),
// contentPadding: EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 10.0), // Adjust content padding
// actionsPadding: EdgeInsets.only(bottom: 10.0, right: 10.0), // Bottom spacing for actions
// actions: [
// TextButton(
// style: TextButton.styleFrom(
// padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Add padding
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(8.0), // Smooth corner buttons
// ),
// foregroundColor: Colors.grey[700], // Text color
// ),
// onPressed: () {
// Navigator.pop(context);
// },
// child: Text(
// "Cancel",
// style: GoogleFonts.poppins(
// fontSize: 16,
// fontWeight: FontWeight.w500,
// ),
// ),
// ),
// ElevatedButton(
// style: ElevatedButton.styleFrom(
// backgroundColor: back, // Updated backgroundColor for button
// padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Add padding
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(8.0), // Smooth corner buttons
// ),
// ),
// onPressed: () {
// Navigator.pushAndRemoveUntil(
// context,
// MaterialPageRoute(builder: (context) => usersign()),
// (Route<dynamic> route) => false );
// },
// child: Text(
// "Logout",
// style: GoogleFonts.poppins(
// color: Colors.white, // White text for the ok button
// fontSize: 16,
// fontWeight: FontWeight.w500,
// ),
// ),
// ),
// ],
// );
// },
// );
//
// },
// child: Text(
// "Log out",
// style: GoogleFonts.poppins(
// color: Colors.black, fontWeight: FontWeight.bold),
// )),