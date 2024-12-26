import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'BotNavi.dart';



class phone extends StatefulWidget {

  phone({super.key,});

  @override
  State<phone> createState() => _phoneState();

}
class _phoneState extends State<phone> {

  bool invalidOtp = false;
  late String verificationid;
  final TextEditingController phonecontroller=TextEditingController();
  final TextEditingController codeController=TextEditingController();
  bool _codeSent=false;
  // bool ivnvalidotp=false;
  String verificationId='';


  Future<void> verify() async {
    PhoneAuthCredential phoneAuthCredential =
    PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: codeController.text);
    signInWithPhoneAuthCredential(phoneAuthCredential);

  }




  ///Send OTP
  Future<void> fetchotp() async {
    await auth.verifyPhoneNumber(
      phoneNumber: "+91${phonecontroller.text}",
      //1234567890',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        this.verificationid = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
      },
    );
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  bool isvisible=false;
  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    try {
      final authCredential =
      await auth.signInWithCredential(phoneAuthCredential);
      if (authCredential.user != null) {

      }
    } on FirebaseAuthException catch (e) {
      print("catch");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Phone OTP",)
      ),
      body: Column(
        children: [
          SizedBox(height: 50,),
          IntlPhoneField(
            controller: phonecontroller,
            decoration: InputDecoration(
              labelText: 'Phone Number',
              border: OutlineInputBorder(
                  borderSide: BorderSide()
              ),
            ),
            initialCountryCode: "+91",
            onChanged: (phone) {
              print(phone.completeNumber);
            },
          ),
          ElevatedButton(onPressed: (){
            setState(() {
              isvisible=true;
            });
            fetchotp();


          }, child:Text("SEND")),
          Visibility(
              visible: isvisible,
              child:Column(
                children: [
                  TextFormField(
                    controller: codeController,
                  ),

                  ElevatedButton(onPressed: () {
                    Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>BotNavi()));
                    verify();

                  },child: Text("Verify"))
                ],
              ) )
        ],
      ),
    );
  }
}