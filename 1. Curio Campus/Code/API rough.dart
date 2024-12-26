// import 'dart:convert';
// import 'dart:io';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:http/http.dart'as http;
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'Color format.dart';
//
// class SS extends StatefulWidget {
//   final String loggedInPhone;
//   const SS({super.key, required this.loggedInPhone});
//
//   @override
//   State<SS> createState() => _SSState();
// }
//
// class _SSState extends State<SS> {
//   String? pdfFileName = "No file chosen"; // Stores chosen pdf file name
//   bool isCertificateUploaded = false; // Track certificate upload status
//   String? pdfErrorMessage; // Error message for wrong file format for PDF
//   bool isSubmitted = false;  // Tracks if the button has been clicked
//   String? selectedCategory;
//   final TextEditingController _skillController = TextEditingController();
//   final TextEditingController _experienceController = TextEditingController();
//   TextEditingController _languageController = TextEditingController();
//   List<String> languages = ["Tamil", "English", "Hindi"]; // Available languages
//   List<String> selectedLanguages = []; // Stores selected languages
//   void _showLanguageDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(
//             "Select Languages",
//             style: GoogleFonts.poppins(),
//           ),
//           content: StatefulBuilder(
//             builder: (BuildContext context, StateSetter setState) {
//               return SingleChildScrollView(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: languages.map((String language) {
//                     return CheckboxListTile(
//                       title: Text(language, style: GoogleFonts.poppins()),
//                       value: selectedLanguages.contains(language),
//                       onChanged: (bool? value) {
//                         setState(() {
//                           if (value == true) {
//                             selectedLanguages.add(language);
//                           } else {
//                             selectedLanguages.remove(language);
//                           }
//                         });
//                       },
//                     );
//                   }).toList(),
//                 ),
//               );
//             },
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text("Cancel", style: GoogleFonts.poppins()),
//             ),
//             TextButton(
//               onPressed: () {
//                 setState(() {
//                   _languageController.text = selectedLanguages.join(', ');
//                 });
//                 Navigator.of(context).pop();
//               },
//               child: Text("OK", style: GoogleFonts.poppins()),
//             ),
//           ],
//         );
//       },
//     );
//   }
//   final TextEditingController _qualificationController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//
//   String? skillName;
//   String? qualification;
//   String? language;
//   String? experience;
//   File? selectedFile;
//
//   Future<void> pickPDF() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['pdf'],
//     );
//
//     if (result != null) {
//       setState(() {
//         selectedFile = File(result.files.single.path!);
//       });
//     }
//   }
//
//   // To upload the data to the API
//   Future<void> submitForm() async {
//     if (_formKey.currentState!.validate()) {
//       if (selectedFile == null) {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text("Please upload a certificate."),
//         ));
//         return;
//       }
//
//       _formKey.currentState!.save();
//
//       var request = http.MultipartRequest(
//           'POST',
//           Uri.parse(
//               'http://49.204.232.254:90/users/updateskills/${widget.loggedInPhone}'));
//
//       request.fields['skillname'] = skillName!;
//       request.fields['experiences'] = experience!;
//       request.fields['qualifications'] = qualification!;
//       request.fields['status'] = 'Approved';
//
//       // Add the certificate file to the request
//       request.files.add(await http.MultipartFile.fromPath(
//         'certificates',
//         selectedFile!.path,
//         // Automatically detects content type, so no need for MediaType
//       ));
//
//       var response = await request.send();
//
//       if (response.statusCode == 200) {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text("Form submitted successfully!"),
//         ));
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text("Failed to submit the form."),
//         ));
//       }
//     }
//   }
//
//
//   String? videoFileName = "No file chosen"; // Stores chosen video file name
//   bool isVideoUploaded = false; // Track video upload status
//   String? videoErrorMessage; // Error message for wrong file format for Video
//   bool isSubmitted1 = false;  // Tracks if the button has been clicked
//   final _formKey1 = GlobalKey<FormState>();
//   final TextEditingController _videoNameController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
//   final TextEditingController _durationController = TextEditingController();
//   Future<void> chooseVideoFile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.video, // Only allow video files
//     );
//     if (result != null) {
//       // Check if a valid video file is selected
//       if (result.files.single.extension == 'mp4' ||
//           result.files.single.extension == 'avi' ||
//           result.files.single.extension == 'mkv') {
//         setState(() {
//           videoFileName = result.files.single.name;
//           videoErrorMessage = null; // Reset error message
//           isVideoUploaded = false; // Reset upload status
//         });
//       } else {
//         setState(() {
//           videoErrorMessage = "Wrong file format. Please select a valid video file."; // Show error
//         });
//       }
//     }
//   }
//   Future<void> uploadVideo() async {
//     // Simulate a video upload process
//     if (videoFileName != "No file chosen" && videoErrorMessage == null) {
//       setState(() {
//         isVideoUploaded = true; // Mark video as uploaded
//       });
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     final themeNotifier = Provider.of<ThemeNotifier>(context);
//     Color buttonColor = themeNotifier.isDarkMode ? Colors.grey : Colors.black;
//     Color TextColor = themeNotifier.isDarkMode ? Colors.white : Colors.black;
//     Color TextColor1 = themeNotifier.isDarkMode ? Colors.white : Colors.white;
//     Color border = themeNotifier.isDarkMode ? Colors.white : Colors.black;
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(),
//         body: SingleChildScrollView(
//           child: Form(key: _formKey,
//             child: Column(
//               children: [
//                 Align(),
//                 Card(
//                   elevation: 10,
//                   child: Container(
//                     height: 650,
//                     width: 400,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5),
//                     ),
//                     child: Column(
//                       children: [
//                         SizedBox(height: 20),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormField(
//                             enabled: !isSubmitted,
//                             controller: _skillController,
//                             readOnly: true,
//                             decoration: InputDecoration(
//                               hintText: 'Skill Name',
//                               hintStyle: GoogleFonts.poppins(color: TextColor),
//                               labelText: "Skill Name",
//                               labelStyle: GoogleFonts.poppins(color: TextColor),
//                               enabledBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(color: border)
//                               ),
//                               suffixIcon: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: DropdownButton<String>(
//                                   items: [
//                                     DropdownMenuItem<String>(
//                                       value: 'Development',
//                                       child: Text('Development', style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
//                                     ),
//                                     DropdownMenuItem<String>(
//                                       value: 'Music',
//                                       child: Text('Music', style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
//                                     ),
//                                     DropdownMenuItem<String>(
//                                       value: 'Creativity',
//                                       child: Text('Creativity', style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
//                                     ),
//                                     DropdownMenuItem<String>(
//                                       value: 'Art',
//                                       child: Text('Art', style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
//                                     ),
//                                     DropdownMenuItem<String>(
//                                       value: 'Dance',
//                                       child: Text('Dance', style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
//                                     ),
//                                     DropdownMenuItem<String>(
//                                       value: 'Photography',
//                                       child: Text('Photography', style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
//                                     ),
//                                     DropdownMenuItem<String>(
//                                       value: 'UI/UX',
//                                       child: Text('UI/UX', style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
//                                     ),
//                                     DropdownMenuItem<String>(
//                                       value: 'Gaming',
//                                       child: Text('Gaming', style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
//                                     ),
//                                   ],
//                                   onChanged: (value) {
//                                     setState(() {
//                                       selectedCategory = value;
//                                       _skillController.text = selectedCategory!;
//                                     });
//                                   },
//                                   hint: Text("Select Skill", style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
//                                   underline: SizedBox(), // Removes default underline
//                                   iconEnabledColor: TextColor,  // Changes icon color
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormField(
//                             enabled: !isSubmitted,
//                             controller: _experienceController,
//                             autovalidateMode: AutovalidateMode.onUserInteraction,
//                             keyboardType: TextInputType.text,
//                             inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(2)],
//                             validator: (input) {
//                               if (input == null || input.isEmpty || !RegExp(r'^[0-9]{1,5}$').hasMatch(input)) {
//                                 return 'Please enter a valid duration';
//                               }
//                               return null;
//                             },
//                             decoration: InputDecoration(
//                                 hintText: 'Experience',
//                                 hintStyle: GoogleFonts.poppins(color: TextColor),
//                                 labelText: "Experience",
//                                 labelStyle: GoogleFonts.poppins(color: TextColor),
//                                 enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(color: border)
//                                 )
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormField(
//                             enabled: !isSubmitted,
//                             controller: _languageController,
//                             readOnly: true, // Prevent user from typing
//                             autovalidateMode: AutovalidateMode.onUserInteraction,
//                             keyboardType: TextInputType.text,
//                             inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),],
//                             decoration: InputDecoration(
//                               hintText: 'Languages',
//                               hintStyle: GoogleFonts.poppins(color: TextColor),
//                               labelText: "Languages",
//                               labelStyle: GoogleFonts.poppins(color: TextColor),
//                               enabledBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(color: border)
//                               ),
//                               suffixIcon: IconButton(
//                                 icon: Icon(Icons.arrow_drop_down, color: TextColor),
//                                 onPressed: _showLanguageDialog, // Show dialog on button press
//                               ),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormField(
//                             enabled: !isSubmitted,
//                             controller: _qualificationController,
//                             autovalidateMode: AutovalidateMode.onUserInteraction,
//                             keyboardType: TextInputType.text,
//                             inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),],
//                             validator: (input) {
//                               if (!RegExp(r"^[A-Za-z]{3,}(?:[-'][A-Za-z]+)*$").hasMatch(input!)) {
//                                 return 'Please enter a valid data';
//                               }
//                               return null;
//                             },
//                             decoration: InputDecoration(
//                                 hintText: 'Qualifications',
//                                 hintStyle: GoogleFonts.poppins(color: TextColor),
//                                 labelText: "Qualifications",
//                                 labelStyle: GoogleFonts.poppins(color: TextColor),
//                                 enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(color: border)
//                                 )
//                             ),
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text("Upload Certificate", style: GoogleFonts.poppins(color: TextColor,fontWeight: FontWeight.w500)),
//                             ),
//                           ],
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Container(
//                             height: 80,
//                             width: 400,
//                             decoration: BoxDecoration(
//                                 border: Border.all(color: border),
//                                 borderRadius: BorderRadius.circular(5)),
//                             child: Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: ElevatedButton(
//                                     onPressed: pickPDF,
//                                     style: ElevatedButton.styleFrom(
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(6),
//                                       ),
//                                       minimumSize: const Size(90, 47),
//                                       backgroundColor: Colors.black,
//                                     ),
//                                     child: Text("Choose files", style: GoogleFonts.poppins(color: TextColor1)),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: Text(
//                                     pdfFileName ?? "No file chosen",
//                                     style: GoogleFonts.poppins(textStyle: TextStyle(overflow: TextOverflow.ellipsis,fontWeight: FontWeight.w500)),
//                                     maxLines: 1,
//                                     softWrap: false,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         if (pdfErrorMessage != null)
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               pdfErrorMessage!,
//                               style: TextStyle(color: Colors.red),
//                             ),
//                           ),
//                         SizedBox(height: 30),
//                         ElevatedButton(
//                           onPressed: () {
//                             if (_formKey.currentState!.validate()) {
//                               if (!isCertificateUploaded) {
//                                 // Check if the certificate has been uploaded
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   SnackBar(content: Text('No files have been uploaded. Please upload a Certificate.')),
//                                 );
//                                 return; // Exit the function if no file is uploaded
//                               }
//                               // All fields are filled and the PDF has been uploaded
//                               setState(() {
//                                 isSubmitted = true;  // Set the state to true when the button is clicked
//                               });
//                             } else {
//                               // If any field is not filled, show error
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(content: Text('Please fill all fields.')),
//                               );
//                             }
//                           },
//                           style: ElevatedButton.styleFrom(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(6),
//                             ),
//                             minimumSize: const Size(130, 55),
//                             backgroundColor: Colors.black,
//                           ),
//                           child: Text("Submit", style: GoogleFonts.poppins(color: TextColor1)),
//                         ),
//                         if (isSubmitted)  // Conditionally show the text if the button is clicked
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text("Approval Pending", style: GoogleFonts.poppins(color: TextColor, fontSize: 16),
//                             ),
//                           ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 15),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     children: [
//                       Center(child: Text("Upload Your Video", style: GoogleFonts.poppins(color: TextColor, fontSize: 20, fontWeight: FontWeight.w500))),
//                     ],
//                   ),
//                 ),
//                 // Future<void> choosePdfFile() async {
//                 //   FilePickerResult? result = await FilePicker.platform.pickFiles(
//                 //     type: FileType.custom,
//                 //     allowedExtensions: ['pdf'], // Only allow PDF files
//                 //   );
//                 //   if (result != null) {
//                 //     // Check if the selected file is a PDF
//                 //     if (result.files.single.extension == 'pdf') {
//                 //       setState(() {
//                 //         pdfFileName = result.files.single.name;
//                 //         pdfErrorMessage = null; // Reset error message
//                 //         isCertificateUploaded = false; // Reset upload status
//                 //       });
//                 //     } else {
//                 //       setState(() {
//                 //         pdfErrorMessage = "Wrong file format. Please select a PDF."; // Show error
//                 //       });
//                 //     }
//                 //   }
//                 // }
//                 // Future<void> uploadCertificate() async {
//                 //   // Simulate a certificate upload process
//                 //   if (pdfFileName != "No file chosen" && pdfErrorMessage == null) {
//                 //     setState(() {
//                 //       isCertificateUploaded = true; // Mark certificate as uploaded
//                 //     });
//                 //   }
//                 // }
//
//
//                 // To pick a PDF file
//                 SizedBox(height: 20),
//                 Card(
//                   elevation: 10,
//                   child: Container(
//                     height: 570,
//                     width: 400,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5),
//                     ),
//                     child: Form(key: _formKey1,
//                       child: Column(
//                         children: [
//                           SizedBox(height: 20),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: TextFormField(
//                               enabled: !isSubmitted1,
//                               controller: _videoNameController,
//                               autovalidateMode: AutovalidateMode.onUserInteraction,
//                               keyboardType: TextInputType.text,
//                               inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),],
//                               validator: (input) {
//                                 if (!RegExp(r"^[A-Za-z]{3,}(?:[-'][A-Za-z]+)*$").hasMatch(input!)) {
//                                   return 'Please enter a valid name';
//                                 }
//                                 return null;
//                               },
//                               decoration: InputDecoration(
//                                   hintText: 'Video Name',
//                                   hintStyle: GoogleFonts.poppins(color: TextColor),
//                                   labelText: "Video Name",
//                                   labelStyle: GoogleFonts.poppins(color: TextColor),
//                                   enabledBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(color: border)
//                                   )
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: TextFormField(
//                               enabled: !isSubmitted1,
//                               controller: _descriptionController,
//                               autovalidateMode: AutovalidateMode.onUserInteraction,
//                               keyboardType: TextInputType.text,
//                               inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),],
//                               validator: (input) {
//                                 if (!RegExp(r"^[A-Za-z]{3,}(?:[-'][A-Za-z]+)*$").hasMatch(input!)) {
//                                   return 'Please enter a valid description';
//                                 }
//                                 return null;
//                               },
//                               decoration: InputDecoration(
//                                   hintText: 'Description',
//                                   hintStyle: GoogleFonts.poppins(color: TextColor),
//                                   labelText: "Description",
//                                   labelStyle: GoogleFonts.poppins(color: TextColor),
//                                   enabledBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(color: border)
//                                   )
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: TextFormField(
//                               enabled: !isSubmitted1,
//                               controller: _durationController,
//                               autovalidateMode: AutovalidateMode.onUserInteraction,
//                               keyboardType: TextInputType.number,
//                               inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(5)],
//                               validator: (input) {
//                                 if (input == null || input.isEmpty || !RegExp(r'^[0-9]{1,5}$').hasMatch(input)) {
//                                   return 'Please enter a valid duration';
//                                 }
//                                 return null;
//                               },
//                               decoration: InputDecoration(
//                                   hintText: 'Duration (In Seconds)',
//                                   hintStyle: GoogleFonts.poppins(color: TextColor),
//                                   labelText: "Duration (In Seconds)",
//                                   labelStyle: GoogleFonts.poppins(color: TextColor),
//                                   enabledBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(color: border)
//                                   )
//                               ),
//                             ),
//                           ),
//                           Row(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Text("Select Video", style: GoogleFonts.poppins(color: TextColor, fontWeight: FontWeight.w500)),
//                               ),
//                             ],
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Container(
//                               height: 80,
//                               width: 400,
//                               decoration: BoxDecoration(
//                                   border: Border.all(color: border),
//                                   borderRadius: BorderRadius.circular(5)),
//                               child: Row(
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: ElevatedButton(
//                                       onPressed: chooseVideoFile,
//                                       style: ElevatedButton.styleFrom(
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.circular(6),
//                                         ),
//                                         minimumSize: const Size(90, 47),
//                                         backgroundColor: Colors.black,
//                                       ),
//                                       child: Text("Select Video", style: GoogleFonts.poppins(color: TextColor1)),
//                                     ),
//                                   ),
//                                   Expanded(
//                                     child: Text(
//                                       videoFileName ?? "No file chosen", style: GoogleFonts.poppins(textStyle: TextStyle(overflow: TextOverflow.ellipsis, fontWeight: FontWeight.w500)),
//                                       maxLines: 1,
//                                       softWrap: false,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           if (videoErrorMessage != null)
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text(
//                                 videoErrorMessage!,
//                                 style: TextStyle(color: Colors.red),
//                               ),
//                             ),
//                           // Padding(
//                           //   padding: const EdgeInsets.all(8.0),
//                           //   child: Row(
//                           //     mainAxisAlignment: MainAxisAlignment.end,
//                           //     children: [
//                           //       if (isVideoUploaded)
//                           //         Padding(
//                           //           padding: const EdgeInsets.all(8.0),
//                           //           child: Row(
//                           //             children: [
//                           //               Text("Uploaded successfully", style: GoogleFonts.poppins(color: CupertinoColors.activeGreen),
//                           //               ),
//                           //             ],
//                           //           ),
//                           //         ),
//                           //       ElevatedButton(
//                           //         onPressed: uploadVideo,
//                           //         style: ElevatedButton.styleFrom(
//                           //           shape: RoundedRectangleBorder(
//                           //             borderRadius: BorderRadius.circular(6),
//                           //           ),
//                           //           minimumSize: const Size(10, 47),
//                           //           backgroundColor: Colors.black,
//                           //         ),
//                           //         child: Text("Upload Video", style: GoogleFonts.poppins(color: TextColor1)),
//                           //       ),
//                           //     ],
//                           //   ),
//                           // ),
//                           SizedBox(height: 30),
//                           ElevatedButton(
//                             onPressed: () {
//                               if (_formKey1.currentState!.validate()) {
//                                 if (!isVideoUploaded) {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     SnackBar(content: Text('No files have been uploaded. Please upload a video.')),
//                                   );
//                                   return;
//                                 }
//                                 setState(() {
//                                   isSubmitted1 = true;
//                                 });
//                               } else {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   SnackBar(content: Text('Please fill all fields.')),
//                                 );
//                               }
//                             },
//                             style: ElevatedButton.styleFrom(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(6),
//                               ),
//                               minimumSize: const Size(130, 55),
//                               backgroundColor: Colors.black,
//                             ),
//                             child: Text("Submit", style: GoogleFonts.poppins(color: TextColor1)),
//                           ),
//                           if (isSubmitted1)
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text("Approval Pending", style: GoogleFonts.poppins(color: TextColor, fontSize: 16),
//                               ),
//                             ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 15,)
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// // ///postvideo by user
// // var PVU = {};
// // List data = [];
// // _postvideobyuser()async{
// //   final response = await http.get(Uri.parse("http://49.204.232.254:90/videos/upload"));
// //   print(response.statusCode);
// //   if(response.statusCode == 200 || response.statusCode == 201){
// //     setState(() {
// //       PVU = json.decode(response.body);
// //       data = json.decode(response.body)["data"];
// //     });
// //   }
// // }
//
// // Padding(
// //   padding: const EdgeInsets.all(8.0),
// //   child: Row(
// //     mainAxisAlignment: MainAxisAlignment.end,
// //     children: [
// //       if (isCertificateUploaded)
// //         Padding(
// //           padding: const EdgeInsets.all(8.0),
// //           child: Text("Uploaded successfully",style: GoogleFonts.poppins(color: CupertinoColors.activeGreen)),
// //         ),
// //       ElevatedButton(
// //         onPressed: uploadCertificate,
// //         style: ElevatedButton.styleFrom(
// //           shape: RoundedRectangleBorder(
// //             borderRadius: BorderRadius.circular(6),
// //           ),
// //           minimumSize: const Size(10, 47),
// //           backgroundColor: Colors.black,
// //         ),
// //         child: Text("Upload Certificate", style: GoogleFonts.poppins(color: TextColor1)),
// //       ),
// //     ],
// //   ),
// // ),
//
//
