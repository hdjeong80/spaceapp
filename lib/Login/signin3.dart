import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:spaceapp/color.dart';
import 'package:spaceapp/datafile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signin3 extends StatefulWidget {
  @override
  _Signin3State createState() => _Signin3State();
}

class _Signin3State extends State<Signin3> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
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
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: check == 0
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              if (check1 == 1 && check2 == 1) check3 = 1;
                              check = 1;
                              if (check == 1 && check1 == 1)
                                setState(() {
                                  buttondisable = false;
                                });
                            });
                          },
                          child: Image.asset(
                            'assets/Ellipse.png',
                            height: 19.53,
                            width: 19.53,
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              if (check3 == 1) check3 = 0;

                              check = 0;
                              buttondisable = true;
                            });
                          },
                          child: Image.asset(
                            'assets/checkbox.png',
                            height: 19.53,
                            width: 19.53,
                          ),
                        ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      if (check == 0)
                        setState(() {
                          if (check1 == 1 && check2 == 1) check3 = 1;
                          check = 1;
                          if (check == 1 && check1 == 1)
                            setState(() {
                              buttondisable = false;
                            });
                        });
                      else
                        setState(() {
                          if (check3 == 1) check3 = 0;
                          check = 0;
                          buttondisable = true;
                        });
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: RichText(
                          text: TextSpan(
                            text: language ? '(필수)' : '(Required)',
                            style: TextStyle(
                                color: containercolor,
                                fontSize: 15,
                                fontFamily: font1),
                            children: <TextSpan>[
                              TextSpan(
                                  text: language
                                      ? '개인정보 수집 및 이용 안내'
                                      : 'Information on collection and use of personal information',
                                  style: TextStyle(
                                      fontFamily: font1, color: Colors.black)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(language ? '보기' : 'Example',
                          style: TextStyle(fontFamily: font1)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: check1 == 0
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              if (check == 1 && check2 == 1) check3 = 1;
                              check1 = 1;
                              if (check == 1 && check1 == 1)
                                setState(() {
                                  buttondisable = false;
                                });
                            });
                          },
                          child: Image.asset(
                            'assets/Ellipse.png',
                            height: 19.53,
                            width: 19.53,
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              if (check3 == 1) check3 = 0;
                              check1 = 0;
                              buttondisable = true;
                            });
                          },
                          child: Image.asset(
                            'assets/checkbox.png',
                            height: 19.53,
                            width: 19.53,
                          ),
                        ),
                ),
                InkWell(
                    onTap: () {
                      setState(() {
                        if (check1 == 0)
                          setState(() {
                            if (check == 1 && check2 == 1) check3 = 1;
                            check1 = 1;
                            if (check == 1 && check1 == 1)
                              setState(() {
                                buttondisable = false;
                              });
                          });
                        else
                          setState(() {
                            if (check3 == 1) check3 = 0;
                            check1 = 0;
                            buttondisable = true;
                          });
                      });
                    },
                    child: SizedBox(
                      width: 10,
                    )),
                InkWell(
                  onTap: () {
                    setState(() {
                      if (check1 == 0)
                        setState(() {
                          if (check == 1 && check2 == 1) check3 = 1;
                          check1 = 1;
                          if (check == 1 && check1 == 1) buttondisable = false;
                        });
                      else
                        setState(() {
                          if (check3 == 1) check3 = 0;
                          check1 = 0;
                          buttondisable = true;
                        });
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: RichText(
                          text: TextSpan(
                            text: language ? '(필수)' : '(Required)',
                            style: TextStyle(
                                color: containercolor,
                                fontSize: 15,
                                fontFamily: font1),
                            children: <TextSpan>[
                              TextSpan(
                                  text: language
                                      ? '제3자 제공동의'
                                      : 'Agree to provide to a third party',
                                  style: TextStyle(
                                      fontFamily: font1, color: Colors.black)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(language ? '보기' : 'Example',
                          style: TextStyle(fontFamily: font1)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                if (check2 == 0) {
                  setState(() {
                    if (check == 1 && check1 == 1) check3 = 1;
                    check2 = 1;
                  });
                } else {
                  setState(() {
                    check3 = 0;
                    check2 = 0;
                  });
                }
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: check2 == 0
                        ? Image.asset(
                            'assets/Ellipse.png',
                            height: 19.53,
                            width: 19.53,
                          )
                        : Image.asset(
                            'assets/checkbox.png',
                            height: 19.53,
                            width: 19.53,
                          ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: RichText(
                          text: TextSpan(
                            text: language ? '(선택) ' : '(Optional)',
                            style: TextStyle(
                                color: containercolor,
                                fontSize: 15,
                                fontFamily: font1),
                            children: <TextSpan>[
                              TextSpan(
                                  text: language
                                      ? '마케팅 수신동의'
                                      : ' Agree to receive marketing',
                                  style: TextStyle(
                                      fontFamily: font1, color: Colors.black)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(language ? '보기' : 'Example',
                          style: TextStyle(fontFamily: font1)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: textcolor,
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                if (check3 == 0) {
                  setState(() {
                    check3 = 1;
                    check = 1;
                    check1 = 1;
                    check2 = 1;
                    buttondisable = false;
                  });
                } else {
                  setState(() {
                    check3 = 0;
                    check = 0;
                    check1 = 0;
                    check2 = 0;
                    buttondisable = true;
                  });
                }
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: check3 == 0
                        ? Image.asset(
                            'assets/Ellipse.png',
                            height: 19.53,
                            width: 19.53,
                          )
                        : Image.asset(
                            'assets/checkbox.png',
                            height: 19.53,
                            width: 19.53,
                          ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: RichText(
                          text: TextSpan(
                            text: language ? '전체동의' : 'Full agreement',
                            style: TextStyle(
                                color: containercolor,
                                fontSize: 15,
                                fontFamily: font1),
                            children: <TextSpan>[],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 20),
              child: Column(
                children: [
                  Text(
                      language
                          ? '(선택) 항목을 포함하여 전체 동의합니다.'
                          : ' Agree to receive marketing',
                      style: TextStyle(fontFamily: font1, color: Colors.black))
                ],
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
                          color: Colors.white, fontSize: 16, fontFamily: font1),
                    ),
                    onPressed: buttondisable
                        ? null
                        : () async {
                            print("Firebase Id:: " + userFirebaseID);
                            print(phone);
                            print(uniqueuser);
                            print(address);
                            setState(() {
                              buttondisable = true;
                            });
                            instans
                                .collection('Users')
                                .where('username', isEqualTo: uniqueuser)
                                .get()
                                .then((QuerySnapshot querydata) async {
                              if (querydata.docs.isNotEmpty) {
                                showSnackbar(
                                    "This Username you have chased is no longer available");
                                setState(() {
                                  buttondisable = false;
                                });
                              } else {
                                await instans
                                    .collection("Users")
                                    .doc(userFirebaseID)
                                    .set({
                                  'username': uniqueuser,
                                  'phone': prephone + phone,
                                  'firebaseid': userFirebaseID,
                                  'address': address,
                                  'imageurl': '',
                                  'about': '',
                                  'pushonoff': true,
                                  'datetime': DateTime.now()
                                });
                                SharedPreferences pref =
                                    await SharedPreferences.getInstance();
                                pref.setString('userid', userFirebaseID);

                                setState(() {
                                  buttondisable = false;
                                });
                                phone = prephone + phone;
                                uniqueuser = uniqueuser;
                                address = address;
                                UserImage = '';
                                UserAbout = '';
                                UserNotification = true;
                                Navigator.pushNamed(context, "Signin4");
                              }
                            });
                          },
                    color: containercolor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showSnackbar(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }
}
