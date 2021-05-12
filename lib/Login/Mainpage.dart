import 'package:flutter/material.dart';
import 'package:spaceapp/color.dart';

import '../datafile.dart';

class Mainpage extends StatefulWidget {
  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            'assets/alien.png',
            height: 117,
            width: 117,
          )),
          SizedBox(
            height: 15,
          ),
          Image.asset(
            'assets/Frame.png',
            height: 43,
            width: 143,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            language
                ? '우주공간에 가입하고 더 많은 \n 서비스와 혜택을 누려보세요🚀'
                : "Join outer space and get more \n Enjoy services and benefits🚀",
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
                  language ? '회원가입' : 'Sign Up',
                  style: TextStyle(
                      color: Colors.white, fontSize: 16, fontFamily: font1),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "Signin1");
                },
                color: containercolor,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.2,
            height: 50,
            // ignore: deprecated_member_use
            child: FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, "Login");
              },
              child: Text(language ? '로그인' : 'Log In',
                  style: TextStyle(
                      color: containercolor, fontSize: 16, fontFamily: font1)),
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: containercolor,
                      width: 1,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(50)),
            ),
          ),
        ],
      ),
    );
  }
}
