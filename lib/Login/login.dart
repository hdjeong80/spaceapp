import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../color.dart';
import '../datafile.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool clcicked=false;
  bool getcodebutton=false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _smsController = TextEditingController();
  String _verificationId;
  final SmsAutoFill _autoFill = SmsAutoFill();
  @override
  void initState() {
    super.initState();
    _auth.setLanguageCode("ko-KR");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      //resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Row(
                children: [
                  IconButton(icon: Icon(Icons.arrow_back , size: 30 , color: textcolor2,), onPressed:  ()=>Navigator.pop(context)),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    height: 34.86,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: RaisedButton(
                        child: Text(language?'회원가입':'Sign Up',style: TextStyle(color: Colors.white,fontSize: 16, fontFamily: font1),),
                        onPressed: (){
                            Navigator.pushNamed(context, "Signin1");
                        },
                        color: buttoncolor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(language? '우주공간 로그인 👽':'Outer Space Login 👽',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 19, fontFamily: font1),),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(language? '우주공간으로 오신 것을 환영합니다!':'Welcome to outer space!',style: TextStyle(color: Colors.black,fontSize: 13, fontFamily: font1),),
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(language? '간편 휴대폰 인증으로 지금 바로 우주를 탐험하세요!':'Explore the universe today with simple phone authentication!',style: TextStyle(color: Colors.black,fontSize: 13, fontFamily: font1),),
              ),
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(language? '대한민국(+82)':'Korea (+82)',style: TextStyle(color: textcolor2,fontWeight: FontWeight.bold, fontSize: 12, fontFamily: font1),),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20 , right: 20),
                      child: TextFormField(
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        controller: _phoneNumberController,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color:textcolor),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: containercolor),
                          ),
                          hintText: language? '핸드폰 번호 입력 (‘-’ 제외)':"Enter mobile phone number (excluding'-')", hintStyle: TextStyle(
                            color: textcolor, fontSize: 16, fontFamily: font1),
                          suffix:GestureDetector(
                            onTap:getcodebutton?null:()async{

                              if(_phoneNumberController.text.length==10)
                                {

                                  setState(() {
                                    getcodebutton=true;

                                  });
                                  instans.collection('Users').where('phone',isEqualTo: (prephone+_phoneNumberController.text)).get().then((QuerySnapshot querydata){
                                    if(querydata.docs.isNotEmpty){
                                      verifyPhoneNumber();
                                      Future.delayed(Duration(milliseconds: 10000), () {
                                        setState(() {
                                          print('in time');
                                          setState(() {
                                            getcodebutton=false;
                                          });
                                        });
                                      });
                                      print('in function');
                                      setState(() {
                                        getcodebutton=true;

                                      });
                                      setState(() {
                                        clcicked=true;
                                      });

                                      print('login');
                                    }
                                    else{
                                      setState(() {
                                        getcodebutton=false;
                                      });
                                      showSnackbar("This User does not Exist please signup first");
                                    }
                                  });
                                }
                              else{
                                showSnackbar("Please enter correct phone number");
                              }


                             // verifyPhoneNumber();
                              //print('hello');
                            },
                            child:Text( language? '인증':"Certification", style: TextStyle(color: getcodebutton?Colors.grey:containercolor, fontSize: 15, fontFamily: font1),),
                          ),
                        ),
                        ),
                      ),

                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(language? '인증번호':"certification Number",style: TextStyle(color: textcolor2,fontWeight: FontWeight.bold, fontSize: 12, fontFamily: font1),),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20 , right: 20),
                      child: TextFormField(
                        maxLength: 6,
                        keyboardType: TextInputType.number,
                        controller: _smsController,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color:textcolor),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: containercolor),
                          ),
                          hintText: language? '인증번호 입력':'Certification Number Input', hintStyle: TextStyle(
                            color: textcolor, fontSize: 16, fontFamily: font1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),




              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(language? '본인확인 절차이며, 다른 용도로는 사용되지 않습니다.':"This is an identity verification process and is not used for any other purpose.",style: TextStyle(color: textcolor2, fontSize: 12, fontFamily: font1),),
              ),
              SizedBox(height: 50,),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width/1.2,
                  height: 50,
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    onPressed: ()async{
                        if(!clcicked){
                          showSnackbar("Please get verification code first");
                        }
                        else if(_phoneNumberController.text.length==10 && _smsController.text.length==6){

                          phone=_phoneNumberController.text;
                          signInWithPhoneNumber();
                        }
                        else{
                          showSnackbar("Please Fill the Mobile no and certificate code");
                        }
                      //signInWithPhoneNumber();
                      //  Navigator.pushNamed(context, "Feed");
                    },
                    child: Text(language? '로그인':'Log In', style: TextStyle(
                        color: containercolor, fontSize: 16,fontWeight: FontWeight.bold, fontFamily: font1
                    )
                    ),
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(side: BorderSide(
                        color: containercolor,
                        width: 2,
                        style: BorderStyle.solid
                    ), borderRadius: BorderRadius.circular(50)),
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
  void verifyPhoneNumber() async{
    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      await _auth.signInWithCredential(phoneAuthCredential);
      showSnackbar("Phone number automatically verified and user signed in: ${_auth.currentUser.uid}");
    };
    PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      showSnackbar('Please check your phone for the verification code.');
      _verificationId = verificationId;
    };
    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      showSnackbar('Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');
    };
    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      //showSnackbar("verification code: " + verificationId);
      _verificationId = verificationId;

    };
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: prephone+_phoneNumberController.text,
          timeout: const Duration(seconds: 5),
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    } catch (e) {
      showSnackbar("Failed to Verify Phone Number: ${e}");
    }
  }

  void signInWithPhoneNumber() async{
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: _smsController.text,
      );

      final User user = (await _auth.signInWithCredential(credential)).user;
      UserUUID=user.uid;
      showSnackbar("Successfully signed in UID: ${user.uid}");
      print("UUUID :: "+user.uid);
      userFirebaseID=_verificationId;
      phone=_phoneNumberController.text;
      SharedPreferences pref=await SharedPreferences.getInstance();
      pref.setString('userid', userFirebaseID);
      Navigator.pushNamed(context, "Feed");
    } catch (e) {
      showSnackbar("Failed to sign in: " + e.toString());
    }
  }
}
