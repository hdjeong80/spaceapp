import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spaceapp/color.dart';

import '../datafile.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    input = 1;
    input1 = 1;
    input2 = 1;
    input3 = 1;
    input4 = 1;
    input5 = 1;
    input6 = 1;
    input7 = 1;
    input8 = 1;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        input = 1;
        input1 = 1;
        input2 = 1;
        input3 = 1;
        input4 = 1;
        input5 = 1;
        input6 = 1;
        input7 = 1;
        input8 = 1;
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          automaticallyImplyLeading: false,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: 30,
                color: textcolor2,
              ),
              onPressed: () {
                input = 1;
                input1 = 1;
                input2 = 1;
                input3 = 1;
                input4 = 1;
                input5 = 1;
                input6 = 1;
                input7 = 1;
                input8 = 1;
                Navigator.pop(context);
              }),
          centerTitle: true,
          title: Text(language ? '카테고리 선택' : 'Select a category',
              style: TextStyle(
                  fontSize: 16, fontFamily: font1, color: Colors.black)),
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        if (input == 0)
                          setState(() {
                            input = 1;
                          });
                        else {
                          setState(() {
                            input = 0;
                          });
                        }
                      },
                      child: Row(
                        children: [
                          input == 0
                              ? Image.asset(
                                  'assets/circle.png',
                                  height: 30,
                                  width: 30,
                                )
                              : Image.asset(
                                  'assets/uncheck.png',
                                  height: 30,
                                  width: 30,
                                ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(language ? '가격' : "price"),
                        ],
                      ),
                    ),

                    Container(
                      child: Flexible(
                        child: TextField(
                          controller: Controllerinput,
                          textAlign: TextAlign.center,
                        ),
                      ), //flexible
                    ), //container
                  ], //widget
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        if (input1 == 0)
                          setState(() {
                            input1 = 1;
                          });
                        else {
                          setState(() {
                            input1 = 0;
                          });
                        }
                      },
                      child: Row(
                        children: [
                          input1 == 0
                              ? Image.asset(
                                  'assets/circle.png',
                                  height: 30,
                                  width: 30,
                                )
                              : Image.asset(
                                  'assets/uncheck.png',
                                  height: 30,
                                  width: 30,
                                ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(language ? '브랜드' : "brand"),
                        ],
                      ),
                    ),

                    Container(
                      child: Flexible(
                        child: TextField(
                          textAlign: TextAlign.center,
                          controller: Controllerinput1,
                        ),
                      ), //flexible
                    ), //container
                  ], //widget
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        if (input2 == 0)
                          setState(() {
                            input2 = 1;
                          });
                        else {
                          setState(() {
                            input2 = 0;
                          });
                        }
                      },
                      child: Row(
                        children: [
                          input2 == 0
                              ? Image.asset(
                                  'assets/circle.png',
                                  height: 30,
                                  width: 30,
                                )
                              : Image.asset(
                                  'assets/uncheck.png',
                                  height: 30,
                                  width: 30,
                                ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(language ? '수량' : "Quantity"),
                        ],
                      ),
                    ),

                    Container(
                      child: Flexible(
                        child: TextField(
                          textAlign: TextAlign.center,
                          controller: Controllerinput2,
                          decoration: InputDecoration(
                            // hintText: language?'1개':'One',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ), //flexible
                    ), //container
                  ], //widget
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        if (input3 == 0)
                          setState(() {
                            input3 = 1;
                          });
                        else {
                          setState(() {
                            input3 = 0;
                          });
                        }
                      },
                      child: Row(
                        children: [
                          input3 == 0
                              ? Image.asset(
                                  'assets/circle.png',
                                  height: 30,
                                  width: 30,
                                )
                              : Image.asset(
                                  'assets/uncheck.png',
                                  height: 30,
                                  width: 30,
                                ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(language ? '구매 날짜' : "Purchase date"),
                        ],
                      ),
                    ),

                    Container(
                      child: Flexible(
                        child: TextField(
                          controller: Controllerinput3,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            //  hintText: language?'애플 가로수길 센터':'Apple Garosu-gil Center',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ), //flexible
                    ), //container
                  ], //widget
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        if (input4 == 0)
                          setState(() {
                            input4 = 1;
                          });
                        else {
                          setState(() {
                            input4 = 0;
                          });
                        }
                      },
                      child: Row(
                        children: [
                          input4 == 0
                              ? Image.asset(
                                  'assets/circle.png',
                                  height: 30,
                                  width: 30,
                                )
                              : Image.asset(
                                  'assets/uncheck.png',
                                  height: 30,
                                  width: 30,
                                ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(language ? '구매처' : "Where to buy"),
                        ],
                      ),
                    ),

                    Container(
                      child: Flexible(
                        child: TextField(
                          controller: Controllerinput4,
                          textAlign: TextAlign.center,
                        ),
                      ), //flexible
                    ), //container
                  ], //widget
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        if (input5 == 0)
                          setState(() {
                            input5 = 1;
                          });
                        else {
                          setState(() {
                            input5 = 0;
                          });
                        }
                      },
                      child: Row(
                        children: [
                          input5 == 0
                              ? Image.asset(
                                  'assets/circle.png',
                                  height: 30,
                                  width: 30,
                                )
                              : Image.asset(
                                  'assets/uncheck.png',
                                  height: 30,
                                  width: 30,
                                ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(language ? '모델명' : "model name"),
                        ],
                      ),
                    ),

                    Container(
                      child: Flexible(
                        child: TextField(
                          controller: Controllerinput5,
                          textAlign: TextAlign.center,
                        ),
                      ), //flexible
                    ), //container
                  ], //widget
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        if (input6 == 0)
                          setState(() {
                            input6 = 1;
                          });
                        else {
                          setState(() {
                            input6 = 0;
                          });
                        }
                      },
                      child: Row(
                        children: [
                          input6 == 0
                              ? Image.asset(
                                  'assets/circle.png',
                                  height: 30,
                                  width: 30,
                                )
                              : Image.asset(
                                  'assets/uncheck.png',
                                  height: 30,
                                  width: 30,
                                ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(language ? '지역' : "area"),
                        ],
                      ),
                    ),

                    Container(
                      child: Flexible(
                        child: TextField(
                          textAlign: TextAlign.center,
                          controller: Controllerinput6,
                          decoration: InputDecoration(
                            //    hintText: language?'애플 가로수길 센터':'Apple Garosu-gil Center',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ), //flexible
                    ), //container
                  ], //widget
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        if (input7 == 0)
                          setState(() {
                            input7 = 1;
                          });
                        else {
                          setState(() {
                            input7 = 0;
                          });
                        }
                      },
                      child: Row(
                        children: [
                          input7 == 0
                              ? Image.asset(
                                  'assets/circle.png',
                                  height: 30,
                                  width: 30,
                                )
                              : Image.asset(
                                  'assets/uncheck.png',
                                  height: 30,
                                  width: 30,
                                ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(language ? '제품번호' : "product no"),
                        ],
                      ),
                    ),

                    Container(
                      child: Flexible(
                        child: TextField(
                          textAlign: TextAlign.center,
                          controller: Controllerinput7,
                          decoration: InputDecoration(
                            // hintText: 'ABCD-1234-1234',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ), //flexible
                    ), //container
                  ], //widget
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: RaisedButton(
                      child: Text(
                        language ? '확인' : 'Confirm',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: font1),
                      ),
                      onPressed: () {
                        if (input == 0 && Controllerinput.text.isEmpty ||
                            input1 == 0 && Controllerinput1.text.isEmpty ||
                            input2 == 0 && Controllerinput2.text.isEmpty ||
                            input3 == 0 && Controllerinput3.text.isEmpty ||
                            input4 == 0 && Controllerinput4.text.isEmpty ||
                            input5 == 0 && Controllerinput5.text.isEmpty ||
                            input6 == 0 && Controllerinput6.text.isEmpty ||
                            input7 == 0 && Controllerinput7.text.isEmpty) {
                          showDialog(
                              context: context,
                              builder: (showcontext) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0))),
                                  content: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            height: 36.17,
                                            width: 36.17,
                                            decoration: BoxDecoration(
                                              color: buttoncolor2,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: InkWell(
                                                onTap: () {
                                                  Navigator.of(showcontext)
                                                      .pop();
                                                },
                                                child: Icon(Icons.close)),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Center(
                                          child: Container(
                                              child: Text(
                                        language
                                            ? '선택한 속성에 데이터를 추가하십시오'
                                            : 'Please add data in selected properties',
                                        style: TextStyle(
                                            fontSize: 15, fontFamily: font1),
                                      ))),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Center(
                                        child: Container(
                                          height: 50,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.5,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            child: RaisedButton(
                                              child: Text(
                                                language ? '확인' : 'OK',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontFamily: font1),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              color: containercolor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              });
                        } else
                          Navigator.pop(context);
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
}
