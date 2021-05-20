import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spaceapp/datafile.dart';

import '../color.dart';

class Signin1 extends StatefulWidget {
  @override
  _Signin1State createState() => _Signin1State();
}

class _Signin1State extends State<Signin1> {
  bool buttonsignup = false;
  bool clcicked = false;
  bool getcodebutton = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _smsController = TextEditingController();
  String _verificationId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: textcolor2,
                  ),
                  onPressed: () => Navigator.pop(context)),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    Text(
                      language ? '우주공간 회원가입 👽' : 'Outer Space Membership 👽',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                          fontFamily: font1),
                    ),
                    Spacer(),
                    Container(
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                          color: buttoncolor,
                          borderRadius: BorderRadius.circular(2)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                          color: textcolor,
                          borderRadius: BorderRadius.circular(2)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                          color: textcolor,
                          borderRadius: BorderRadius.circular(2)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                          color: textcolor,
                          borderRadius: BorderRadius.circular(2)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  language ? '우주공간으로 오신 것을 환영합니다!' : 'Welcome to outer space!',
                  style: TextStyle(
                      color: Colors.black, fontSize: 13, fontFamily: font1),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  language
                      ? '간편 휴대폰 인증으로 지금 바로 우주를 탐험하세요!'
                      : 'Explore the universe today with simple phone authentication!',
                  style: TextStyle(
                      color: Colors.black, fontSize: 13, fontFamily: font1),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  language ? '대한민국(+82)' : 'Korea (+82)',
                  style: TextStyle(
                      color: textcolor2,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      fontFamily: font1),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        maxLength: 11,
                        keyboardType: TextInputType.number,
                        controller: _phoneNumberController,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: textcolor),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: containercolor),
                          ),
                          hintText: language
                              ? '핸드폰 번호 입력 (‘-’ 제외)'
                              : "Enter mobile phone number (excluding'-')",
                          hintStyle: TextStyle(
                              color: textcolor,
                              fontSize: 16,
                              fontFamily: font1),
                          suffix: GestureDetector(
                            onTap: getcodebutton
                                ? null
                                : () async {
                                    if (_phoneNumberController.text.length ==
                                        11) {
                                      setState(() {
                                        getcodebutton = true;
                                      });

                                      instans
                                          .collection('Users')
                                          .where('phone',
                                              isEqualTo: prephone +
                                                  _phoneNumberController.text
                                                      .substring(1))
                                          .get()
                                          .then((QuerySnapshot querydata) {
                                        if (querydata.docs.isNotEmpty) {
                                          showSnackbar(
                                              "This user is already exists");
                                        } else {
                                          verifyPhoneNumber();
                                          Future.delayed(
                                              Duration(milliseconds: 60000),
                                              () {
                                            setState(() {
                                              print('in time');
                                              setState(() {
                                                getcodebutton = false;
                                              });
                                            });
                                          });
                                          print('in function');

                                          setState(() {
                                            clcicked = true;
                                          });
                                          print('login');
                                        }
                                      });
                                    } else {
                                      showSnackbar(
                                          "Please enter correct phone number");
                                    }

                                    // verifyPhoneNumber();
                                    //print('hello');
                                  },
                            child: Text(
                              language ? '인증' : "Certification",
                              style: TextStyle(
                                  color: getcodebutton
                                      ? Colors.grey
                                      : containercolor,
                                  fontSize: 15,
                                  fontFamily: font1),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            language ? '인증번호' : "certification Number",
                            style: TextStyle(
                                color: textcolor2,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                fontFamily: font1),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        maxLength: 6,
                        keyboardType: TextInputType.number,
                        controller: _smsController,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: textcolor),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: containercolor),
                          ),
                          hintText: language
                              ? '인증번호 입력'
                              : 'Certification Number Input',
                          hintStyle: TextStyle(
                              color: textcolor,
                              fontSize: 16,
                              fontFamily: font1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  language
                      ? '본인확인 절차이며, 다른 용도로는 사용되지 않습니다.'
                      : "This is an identity verification process and is not used for any other purpose.",
                  style: TextStyle(
                      color: textcolor2, fontSize: 12, fontFamily: font1),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: RaisedButton(
                      child: Text(
                        language ? '다음' : 'Next',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: font1),
                      ),
                      onPressed: buttonsignup
                          ? null
                          : () {
                              if (!clcicked) {
                                showSnackbar(
                                    "Please get verification code first");
                              } else if (_phoneNumberController.text.length ==
                                      11 &&
                                  _smsController.text.length == 6) {
                                setState(() {
                                  buttonsignup = true;
                                });
                                instans
                                    .collection('Users')
                                    .where('phone',
                                        isEqualTo: prephone +
                                            _phoneNumberController.text
                                                .substring(1))
                                    .get()
                                    .then((QuerySnapshot querydata) {
                                  if (querydata.docs.isNotEmpty) {
                                    showSnackbar("This user is already exists");
                                    setState(() {
                                      buttonsignup = false;
                                    });
                                  } else {
                                    setState(() {
                                      buttonsignup = false;
                                    });
                                    signInWithPhoneNumber();
                                  }
                                });
                              } else {
                                showSnackbar(
                                    "Please Fill the Mobile no and certificate code");
                              }
                            },
                      color: containercolor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showSnackbar(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }

  void verifyPhoneNumber() async {
    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      await _auth.signInWithCredential(phoneAuthCredential);
      UserUUID = _auth.currentUser.uid;
      userFirebaseID = _auth.currentUser.uid;
      phone = _phoneNumberController.text.substring(1);
      Navigator.pushNamed(context, "Signin2");
      showSnackbar(
          "Phone number automatically verified and user signed in: ${_auth.currentUser.uid}");
    };
    PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      showSnackbar('Please check your phone for the verification code.');
      userFirebaseID = _auth.currentUser.uid;
      _verificationId = verificationId;
    };
    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      showSnackbar(
          'Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');
    };
    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      //showSnackbar("verification code: " + verificationId);
      _verificationId = verificationId;
    };
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: prephone + _phoneNumberController.text.substring(1),
          timeout: const Duration(seconds: 60),
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    } catch (e) {
      showSnackbar("Failed to Verify Phone Number: ${e}");
    }
  }

  void signInWithPhoneNumber() async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: _smsController.text,
      );

      final User user = (await _auth.signInWithCredential(credential)).user;
      UserUUID = user.uid;
      showSnackbar("Successfully signed in UID: ${user.uid}");
      userFirebaseID = user.uid;
      phone = _phoneNumberController.text.substring(1);
      Navigator.pushNamed(context, "Signin2");
    } catch (e) {
      showSnackbar("Failed to sign in: " + e.toString());
    }
  }
}
