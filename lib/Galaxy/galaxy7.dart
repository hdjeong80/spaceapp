import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:spaceapp/datafile.dart';

import '../color.dart';

class Galaxy7 extends StatefulWidget {
  @override
  _Galaxy7State createState() => _Galaxy7State();
}

class _Galaxy7State extends State<Galaxy7> {
  @override
  Widget build(BuildContext context) {
    Widget image_slider_carousel = Container(
      height: 347,
      width: MediaQuery.of(context).size.width,
      child: Carousel(
        boxFit: BoxFit.fill,
        images: [
          AssetImage('assets/mac.jpg'),
          AssetImage('assets/mac.jpg'),
          AssetImage('assets/mac.jpg'),
          AssetImage('assets/mac.jpg'),
          AssetImage('assets/mac.jpg'),
        ],
        autoplay: true,
        dotSize: 5.0,
        indicatorBgPadding: 0.0,
        dotSpacing: 20.0,
        dotVerticalPadding: 10.0,
        dotBgColor: Colors.transparent,
        moveIndicatorFromBottom: 180.0,
        noRadiusForIndicator: true,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            image_slider_carousel,
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 20, right: 10),
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                    image: AssetImage('assets/avatar.png')),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: language
                                          ? '우주탐사'
                                          : 'Space exploration ',
                                      style: TextStyle(
                                          color: textcolor3,
                                          fontSize: 15,
                                          fontFamily: font1,
                                          fontWeight: FontWeight.bold),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: language ? '님의' : 'Of ',
                                            style: TextStyle(
                                                fontFamily: font1,
                                                fontSize: 16,
                                                color: textcolor3)),
                                        TextSpan(
                                            text: language
                                                ? '테크우주'
                                                : 'Tech Universe \n ',
                                            style: TextStyle(
                                                fontFamily: font1,
                                                color: textcolor3,
                                                fontSize: 15)),
                                        TextSpan(
                                            text: language ? '행성' : 'planet',
                                            style: TextStyle(
                                                fontFamily: font1,
                                                color: textcolor3,
                                                fontSize: 16)),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    language
                                        ? '서울특별시 마곡동'
                                        : 'Magok-dong, Seoul',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: font1,
                                        color: textcolor),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Text(
                              language ? '4시간 전' : '4 hours ago',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: font1,
                                  color: tetxcolor4),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Divider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      language ? '나의 M1 맥북프로' : 'My m1 macbook pro',
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          fontFamily: font1,
                          color: textcolor3),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      language
                          ? '윈도우만 쓰다가 처음으로 맥북으로 넘어왔어요!'
                          : 'It was the first time I used only Windows and came to the MacBook!',
                      style: TextStyle(
                          fontSize: 16, fontFamily: font1, color: textcolor3),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Divider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      language ? '상세정보' : 'More information',
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: font1,
                          fontWeight: FontWeight.bold,
                          color: textcolor3),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              'assets/circle.png',
                              height: 30,
                              width: 30,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Image.asset(
                              'assets/circle.png',
                              height: 30,
                              width: 30,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Image.asset(
                              'assets/circle.png',
                              height: 30,
                              width: 30,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Image.asset(
                              'assets/circle.png',
                              height: 30,
                              width: 30,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              language ? '수량' : 'Quantity',
                              style: TextStyle(
                                  fontFamily: font1,
                                  color: textcolor,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              language ? '구매 날짜' : 'Purchase date',
                              style: TextStyle(
                                  fontFamily: font1,
                                  color: textcolor,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              language ? '지역' : 'area',
                              style: TextStyle(
                                  fontFamily: font1,
                                  color: textcolor,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              language ? '제품번호' : 'product no',
                              style: TextStyle(
                                  fontFamily: font1,
                                  color: textcolor,
                                  fontSize: 15),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              language ? '1 개' : 'One',
                              style: TextStyle(
                                  fontFamily: font1,
                                  color: textcolor3,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              language ? '20-11-19' : '20-11-19',
                              style: TextStyle(
                                  fontFamily: font1,
                                  color: textcolor3,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              language
                                  ? '애플 가로수길 센터'
                                  : 'Apple Garosu-gil Center',
                              style: TextStyle(
                                  fontFamily: font1,
                                  color: textcolor3,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              language ? 'ABCD-1234-1234' : 'ABCD-1234-1234',
                              style: TextStyle(
                                  fontFamily: font1,
                                  color: textcolor3,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 2,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'Galaxy71');
                    },
                    color: buttoncolor2,
                    child: Text(
                      language ? '제안하기' : 'Make a suggestion',
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: font1,
                          color: buttoncolor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 2,
                  child: RaisedButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, "");
                    },
                    color: buttoncolor,
                    child: Text(
                      language ? '우주톡하기' : 'Space Talk',
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: font1,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
