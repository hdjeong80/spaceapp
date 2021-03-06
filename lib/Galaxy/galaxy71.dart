import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:spaceapp/datafile.dart';

import '../color.dart';

class Galaxy71 extends StatefulWidget {
  @override
  _Galaxy7_1State createState() => _Galaxy7_1State();
}

class _Galaxy7_1State extends State<Galaxy71> {
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              image_slider_carousel,
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 15),
                    child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () => Navigator.pop(context)),
                  ),
                ],
              ),
            ],
          ),
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
                                        ? '????????????'
                                        : 'Space exploration ',
                                    style: TextStyle(
                                        color: textcolor3,
                                        fontSize: 15,
                                        fontFamily: font1,
                                        fontWeight: FontWeight.bold),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: language ? '??????' : 'Of ',
                                          style: TextStyle(
                                              fontFamily: font1,
                                              fontSize: 16,
                                              color: textcolor3)),
                                      TextSpan(
                                          text: language
                                              ? '????????????'
                                              : 'Tech Universe \n ',
                                          style: TextStyle(
                                              fontFamily: font1,
                                              color: textcolor3,
                                              fontSize: 15)),
                                      TextSpan(
                                          text: language ? '??????' : 'planet',
                                          style: TextStyle(
                                              fontFamily: font1,
                                              color: textcolor3,
                                              fontSize: 16)),
                                    ],
                                  ),
                                ),
                                Text(
                                  language ? '??????????????? ?????????' : 'Magok-dong, Seoul',
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
                            language ? '4?????? ???' : '4 hours ago',
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
                    language ? '?????? M1 ????????????' : 'My m1 macbook pro',
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
                        ? '???????????? ????????? ???????????? ???????????? ???????????????!'
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
                    language ? '????????????' : 'More information',
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
                            language ? '??????' : 'Quantity',
                            style: TextStyle(
                                fontFamily: font1,
                                color: textcolor,
                                fontSize: 15),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            language ? '?????? ??????' : 'Purchase date',
                            style: TextStyle(
                                fontFamily: font1,
                                color: textcolor,
                                fontSize: 15),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            language ? '??????' : 'area',
                            style: TextStyle(
                                fontFamily: font1,
                                color: textcolor,
                                fontSize: 15),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            language ? '????????????' : 'product no',
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
                            language ? '1 ???' : 'One',
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
                            language ? '?????? ???????????? ??????' : 'Apple Garosu-gil Center',
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
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, "Upload");
              },
              color: buttoncolor,
              child: Text(
                language ? '???????????????' : 'Space Talk',
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
    );
  }
}
