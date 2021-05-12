import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:spaceapp/color.dart';
import 'package:spaceapp/datafile.dart';

class Signin2 extends StatefulWidget {
  @override
  _Signin2State createState() => _Signin2State();
}

class _Signin2State extends State<Signin2> {
  bool buttondisable = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
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
                      language ? '선택정보 입력' : 'Enter optional information',
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
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  language
                      ? '우주공간에서 사용하실 멋진 닉네임을 입력해주세요.'
                      : 'Please enter a nice nickname to use in outer space.',
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
                  language ? '닉네임' : 'nickname',
                  style: TextStyle(
                      color: textcolor2,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: textcolor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: containercolor),
                    ),
                    hintText: language ? '홍길동' : "Hong Gil Dong",
                    hintStyle: TextStyle(
                        color: textcolor, fontSize: 16, fontFamily: font1),
                    suffix: GestureDetector(
                      onTap: () {
                        if (_usernameController.text.length >= 4) {
                          instans
                              .collection('Users')
                              .where('username',
                                  isEqualTo: _usernameController.text)
                              .get()
                              .then((QuerySnapshot querydata) {
                            if (querydata.docs.isNotEmpty) {
                              showSnackbar("This username is already exists");
                            } else {
                              showSnackbar("Username is Available");
                              print('Username is Available');
                            }
                          });
                        } else {
                          showSnackbar("Username should be more than 4 char");
                        }
                      },
                      child: Text(
                        language ? '중복확인' : "Double Check",
                        style: TextStyle(
                            color: containercolor,
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
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  language ? '지역 입력' : "Area input",
                  style: TextStyle(
                      color: textcolor2,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      fontFamily: font1),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: textcolor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: containercolor),
                    ),
                    hintText: language ? '서울시 강남구' : 'Gangnam-gu, Seoul',
                    hintStyle: TextStyle(
                        color: textcolor, fontSize: 16, fontFamily: font1),
                    suffixText: "7/10",
                    suffixStyle: TextStyle(color: textcolor, fontSize: 15),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  language
                      ? '‘내 프로필’에 입력될 정보로, 주 활동 지역을 입력해주세요. '
                      : "As the information to be entered in'My Profile', please enter your main activity area.",
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
                      onPressed: buttondisable
                          ? null
                          : () {
                              if (_usernameController.text.length != 0) {
                                if (_usernameController.text.length >= 4) {
                                  setState(() {
                                    buttondisable = true;
                                  });
                                  instans
                                      .collection('Users')
                                      .where('username',
                                          isEqualTo: _usernameController.text)
                                      .get()
                                      .then((QuerySnapshot querydata) {
                                    if (querydata.docs.isNotEmpty) {
                                      showSnackbar(
                                          "This username is already exists change your username");
                                      setState(() {
                                        buttondisable = false;
                                      });
                                    } else {
                                      uniqueuser = _usernameController.text;
                                      address = _addressController.text;
                                      print(uniqueuser);
                                      print(address);
                                      setState(() {
                                        buttondisable = false;
                                      });
                                      Navigator.pushNamed(context, "Signin3");
                                    }
                                  });
                                } else {
                                  showSnackbar(
                                      "Username should be more than 4 char");
                                }
                              } else {
                                uniqueuser = _usernameController.text;
                                address = _addressController.text;
                                print(uniqueuser);
                                print(address);
                                Navigator.pushNamed(context, "Signin3");
                              }
                              //   Navigator.pushNamed(context, "Signin3");
                            },
                      color: containercolor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                  child: InkWell(
                      onTap: () {
                        //uniqueuser=_usernameController.text;
                        //address=_addressController.text;
                        Navigator.pushNamed(context, 'Signin3');
                      },
                      child: Text(
                        language ? '나중에 할래요' : "I'll do it later",
                        style: TextStyle(
                            color: textcolor3,
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                            fontFamily: font1),
                      )))
            ],
          ),
        ),
      ),
    );
  }

  void showSnackbar(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }
}
