import 'package:flutter/material.dart';
import 'package:spaceapp/color.dart';

import '../datafile.dart';

class Signin4 extends StatefulWidget {
  @override
  _Signin4State createState() => _Signin4State();
}

class _Signin4State extends State<Signin4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Image.asset(
              'assets/rocket.png',
              height: 237,
              width: 258,
            )),
            SizedBox(
              height: 30,
            ),
            Text(
              language
                  ? '우주인이 되신 것을 축하드립니다!\n이제 우주공간에서 이야기가 가득한\n   멋진 제품들을 소개해주세요 ☺️'
                  : "Congratulations on becoming an astronaut!\n         Now full of stories in outer space\n          Please introduce cool products ☺️",
              style: TextStyle(fontSize: 16, fontFamily: font1),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width / 1.2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: RaisedButton(
                  child: Text(
                    language ? '탐험하기' : 'To explore',
                    style: TextStyle(
                        color: Colors.white, fontSize: 16, fontFamily: font1),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'Feed');
                  },
                  color: containercolor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
