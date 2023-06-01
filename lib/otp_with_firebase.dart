import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internet_connectionn_checker/internet.dart';
import 'package:pinput/pinput.dart';
import 'package:upgrader/upgrader.dart';

class Otp extends StatefulWidget {
  Otp({Key? key,
    this.isContainer,
    this.isOnTap,
    this.isPhoneText,
    this.isText})
      : super(key: key);

  bool? isContainer = true;
  bool? isText = true;
  bool? isPhoneText = true;
  bool? isOnTap = true;

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final TextEditingController countryCode = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  String phone = "";
  final FirebaseAuth auth = FirebaseAuth.instance;
  static String verify = "";
  String code = "";
  static const url = "https://img.freepik.com/free-vector/hacker-breaking-lock-get-access-personal-information-computer-isometric_1284-63723.jpg?w=740&t=st=1678780175~exp=1678780775~hmac=70dc7dc39e763cea08899137085137459f2c911ec7e433d6d9bc57dcb70357c1";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countryCode.text = "+91";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: UpgradeAlert(
        upgrader: Upgrader(
          debugDisplayAlways: true,
canDismissDialog: true,
durationUntilAlertAgain: Duration(days: 1),

dialogStyle: Platform.isIOS ? UpgradeDialogStyle.cupertino : UpgradeDialogStyle.material
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 200,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(150),
                      child: Image.network(
                        url,
                        fit: BoxFit.cover,
                      ))),
              const Text(
                "Phone Verification",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const Text(
                "We need to register your phone number \n                     before you start ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 20,
              ),
            (widget.isContainer!)
                  ? Container(
                height: 55,
                width: 320,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 35,
                      child: TextField(
                          controller: countryCode,
                          decoration: const InputDecoration(
                              border: InputBorder.none)),
                    ),
                    const Text(
                      "| ",
                      style: TextStyle(fontSize: 30),
                    ),
                    Expanded(
                        child: TextFormField(
                          onChanged: (val) {
                            phone = val;
                          },
                          controller: phoneNumber,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration:
                          const InputDecoration(border: InputBorder.none),
                        ))
                  ],
                ),
              )
                  : Pinput(
                onChanged: (val) {
                  code = val;
                },
                length: 6,
                showCursor: true,
              ) ,
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: 300,
                  height: 45,
                  child: ElevatedButton(
                      onPressed: () async {
                        widget.isText!
                            ?  sendOtp() : _otpVerify();
                      },
                      style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                      child: Text(widget.isText!
                          ? "Send the Code"
                          : "Verify the Phone Number"))),
              widget.isPhoneText!
                  ? Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Edit Phone Number ? ",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }

  Future<void> sendOtp() async {

    if (phoneNumber.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please Enter Mobile Number '),
      ));
    }
    else if(phoneNumber.text.length < 10)
      {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Please Enter Mobile Number Correctly'),
        ));
      }
    else {
     await FirebaseAuth.instance.verifyPhoneNumber(
       phoneNumber: countryCode.text + phone,
       verificationCompleted:
           (PhoneAuthCredential credential) {},
       verificationFailed: (FirebaseAuthException e) {},
       codeSent:
           (String verificationId, int? resendToken) async {
         verify = verificationId;

           await Navigator.push(
             context,
             MaterialPageRoute(
                 builder: (context) => const OtpSend()));


       },
       codeAutoRetrievalTimeout:
           (String verificationId) {},
     );
    }
  }

  Future<void> _otpVerify() async {
    // Create a PhoneAuthCredential with the code
    try {
      PhoneAuthCredential credential =
      PhoneAuthProvider.credential(verificationId: verify, smsCode: code);

      // Sign the user in (or link) with the credential
      await auth.signInWithCredential(credential);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Internet()));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please Enter Valid Otp'),
      ));
    }
  }
}

class OtpSend extends StatefulWidget {
  const OtpSend({Key? key}) : super(key: key);

  @override
  State<OtpSend> createState() => _OtpSendState();
}

class _OtpSendState extends State<OtpSend> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {

              });
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Colors.black,
            ),
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Otp(
                  isContainer: false,
                  isOnTap: true,
                  isPhoneText: true,
                  isText: false,
                )),
          ],
        ),
      ),
    );
  }
}
