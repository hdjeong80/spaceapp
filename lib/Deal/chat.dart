import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spaceapp/datafile.dart';

import '../color.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width / 1,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextField(
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: containercolor),
                      borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.add,
                    size: 25,
                    color: textcolor2,
                  ),
                  suffixIcon: IconButton(
                    icon: Image.asset(
                      'assets/send.png',
                      height: 21.60,
                      width: 21.60,
                    ),
                    onPressed: () {},
                  ),
                  contentPadding: EdgeInsets.zero,
                  hintStyle: new TextStyle(
                      color: textcolor, fontFamily: font1, fontSize: 15),
                  hintText:
                      language ? '메시지를 입력하세요' : 'Please enter your message',
                  fillColor: Colors.white),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 30,
              color: textcolor2,
            ),
            onPressed: () => Navigator.pop(context)),
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/setting.png',
              height: 20,
              width: 20,
            ),
            onPressed: () {},
          ),
        ],
        title: Center(
            child: Text(language ? '우주탐사' : 'Space Exploration',
                style: TextStyle(
                    fontSize: 16, fontFamily: font1, color: Colors.black))),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  height: 76,
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 7, bottom: 7),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 7),
                            child: Container(
                              height: 58,
                              width: 75.14,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: AssetImage('assets/mac.jpg'),
                                      fit: BoxFit.fill)),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  language ? '나의 M1 맥북프로' : 'My m1 macbook pro',
                                  style: TextStyle(
                                      fontFamily: font1,
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: language
                                          ? '거래제안 '
                                          : 'Transaction Proposal',
                                      style: TextStyle(
                                        color: textcolor3,
                                        fontSize: 15,
                                        fontFamily: font1,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: language ? 'ON' : 'ON ',
                                            style: TextStyle(
                                                fontFamily: font1,
                                                fontSize: 15,
                                                color: containercolor)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: new Container(
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 20.0),
                          child: Divider(
                            color: textcolor,
                            height: 36,
                          )),
                    ),
                    Text(
                      language ? '어제' : 'Today',
                      style: TextStyle(
                          fontFamily: font1, fontSize: 13, color: textcolor),
                    ),
                    Expanded(
                      child: new Container(
                          margin:
                              const EdgeInsets.only(left: 20.0, right: 10.0),
                          child: Divider(
                            color: textcolor,
                            height: 36,
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.7,
                        decoration: BoxDecoration(
                          color: button2,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 11),
                                child: Container(
                                  height: 151,
                                  width: 227,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        image: AssetImage('assets/mac.jpg'),
                                        fit: BoxFit.fill),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          language ? '제안가격' : 'Suggested Price',
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.white,
                                              fontFamily: font1),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          language
                                              ? '거래동네'
                                              : 'Trading district',
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.white,
                                              fontFamily: font1),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                5,
                                            child: Text(
                                              language
                                                  ? '1,200,000 원(₩)'
                                                  : '1,200,000 KRW(₩)',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                  fontFamily: font1),
                                            )),
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                5,
                                            child: Text(
                                              language
                                                  ? '서울특별시 마곡동'
                                                  : 'Magok-dong, Seoul',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                  fontFamily: font1),
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
