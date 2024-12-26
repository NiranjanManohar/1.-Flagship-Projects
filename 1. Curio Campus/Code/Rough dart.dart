// import 'dart:async';
// import 'dart:convert';
// import 'package:curio/Bottom%20Navigation.dart';
// import 'package:curio/Front%20Page.dart';
// import 'package:curio/Login%20Page.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:loading_overlay/loading_overlay.dart';
// import 'package:pinput/pinput.dart';
// import 'package:provider/provider.dart';
// import 'Category Page.dart';
// import 'Color format.dart';
// import 'Forgot Password.dart';
// import 'Profile Page.dart';
// import 'Search Page.dart';
// import 'Sign up.dart';
// import 'package:http/http.dart' as http;
//
// class LPP extends StatefulWidget {
//   const LPP({super.key});
//
//   @override
//   State<LPP> createState() => _LPPState();
// }
//
// class _LPPState extends State<LPP> {
//   final _formkey = GlobalKey<FormState>();
//   TextEditingController phoneController = TextEditingController();
//   TextEditingController pinController = TextEditingController();
//
//   bool isLoading = false;
//   bool isPasswordVisible = false;
//
//   void togglePasswordVisibility() {
//     setState(() {
//       isPasswordVisible = !isPasswordVisible;
//     });
//   }
//
//   Future<void> _fetchData() async {
//     setState(() {
//       isLoading = true;
//     });
//
//     try {
//       final response = await http.post(
//         Uri.parse("http://49.204.232.254:90/users/login"),
//         headers: {"Content-Type": "application/json"},
//         body: json.encode({
//           "phonenumber": phoneController.text,
//           "password": pinController.text,
//         }),
//       );
//
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => BNN(loggedInPhone: phoneController.text),
//           ),
//         );
//       } else {
//         _showErrorDialog("Invalid Credential", "Kindly check your user credentials");
//       }
//     } catch (error) {
//       _showErrorDialog("Error", "Something went wrong, please try again.");
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }
//
//   void _showErrorDialog(String title, String content) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text(title, style: GoogleFonts.poppins(fontSize: 25)),
//         content: Text(content, style: GoogleFonts.poppins(fontSize: 20)),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text("OK", style: GoogleFonts.poppins(fontSize: 14)),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final themeNotifier = Provider.of<ThemeNotifier>(context);
//     Color buttonColor = themeNotifier.isDarkMode ? Colors.grey : Colors.black;
//     Color textColor = themeNotifier.isDarkMode ? Colors.white : Colors.black;
//
//     return LoadingOverlay(
//       isLoading: isLoading,
//       opacity: 0.5,
//       progressIndicator: SpinKitCircle(
//         size: 50,
//         color: Colors.blue,
//       ),
//       child: Scaffold(
//         body: Form(
//           key: _formkey,
//           child: Column(
//             children: [
//               SizedBox(height: 145),
//               Container(
//                 height: 90,
//                 width: 300,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(image: AssetImage("Assets/CurioCampus.png")),
//                 ),
//               ),
//               SizedBox(height: 40),
//               Card(
//                 elevation: 10,
//                 color: Colors.white,
//                 child: Container(
//                   height: 440,
//                   width: 400,
//                   child: Column(
//                     children: [
//                       SizedBox(height: 30),
//                       TextFormField(
//                         controller: phoneController,
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                         keyboardType: TextInputType.number,
//                         inputFormatters: [
//                           FilteringTextInputFormatter.digitsOnly,
//                           LengthLimitingTextInputFormatter(10)
//                         ],
//                         validator: (input) {
//                           if (!RegExp(r'^(?:[+0]9)?[0-9]{10}$').hasMatch(input!)) {
//                             return 'Please enter a valid phone number';
//                           }
//                           return null;
//                         },
//                         decoration: InputDecoration(
//                           prefix: Text("+91"),
//                           contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
//                           prefixIcon: Icon(Icons.call),
//                           border: OutlineInputBorder(),
//                           hintText: "Phone Number",
//                           labelText: "Phone Number",
//                           labelStyle: GoogleFonts.poppins(color: textColor),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Pinput(
//                           length: 6,
//                           controller: pinController,
//                           obscureText: !isPasswordVisible,
//                           keyboardType: TextInputType.number,
//                           inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//                           onChanged: (pin) {
//                             if (pin.length == 6) {
//                               // validatePasswords();
//                             }
//                           },
//                         ),
//                       ),
//                       SizedBox(height: 10),
//                       ElevatedButton(
//                         onPressed: () {
//                           if (_formkey.currentState!.validate()) {
//                             _fetchData();
//                           }
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: buttonColor,
//                           minimumSize: Size(290, 50),
//                         ),
//                         child: Text("Login", style: GoogleFonts.poppins(color: Colors.white)),
//                       ),
//                       SizedBox(height: 10),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(context, MaterialPageRoute(builder: (context) => FP()));
//                         },
//                         child: Text("Forgot Password?", style: GoogleFonts.poppins(color: Colors.blue)),
//                       ),
//                       SizedBox(height: 16.0),
//                       GestureDetector(
//                         onTap: () {
//                           // Implement Google Sign-In here
//                         },
//                         child: Container(
//                           height: 50,
//                           width: 300,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(5),
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.network("https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png", height: 50, width: 50),
//                               SizedBox(width: 10),
//                               Text("Sign in with Google", style: GoogleFonts.poppins(color: textColor)),
//                             ],
//                           ),
//                         ),
//                       ),
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
//
// class BNN extends StatefulWidget {
//   final String loggedInPhone;
//   const BNN({super.key, required this.loggedInPhone});
//
//   @override
//   _BNNState createState() => _BNNState();
// }
//
// class _BNNState extends State<BN> {
//   int cindex = 0;
//
//   void tap(int index) {
//     setState(() {
//       cindex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     List<Widget> pages = [
//       frontpage(loggedInPhone: widget.loggedInPhone, name: '', gmail: '', photourl: '',),
//       SP(),
//       CP(),
//       PP(),
//     ];
//
//     final themeNotifier = Provider.of<ThemeNotifier>(context);
//     Color buttonColor = themeNotifier.isDarkMode ? Colors.grey : Colors.black;
//     Color navBarBackgroundColor = themeNotifier.isDarkMode ? Colors.black : Colors.deepPurple;
//
//     return Scaffold(
//       body: pages[cindex],
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: navBarBackgroundColor,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: "Home",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//             label: "Search",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.list_alt_outlined),
//             label: "Category",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: "Profile",
//           ),
//         ],
//         currentIndex: cindex,
//         selectedItemColor: Colors.white,
//         unselectedItemColor: Colors.white54,
//         onTap: tap,
//       ),
//     );
//   }
// }
//
//
// class frontpage1 extends StatelessWidget {
//   final String loggedInPhone;
//
//   const frontpage1({Key? key, required this.loggedInPhone, required String name, required String gmail, required String photourl}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home', style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.deepPurple,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Welcome to the Home Page!',
//               style: TextStyle(fontSize: 24),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Logged in as: $loggedInPhone',
//               style: TextStyle(fontSize: 16),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }