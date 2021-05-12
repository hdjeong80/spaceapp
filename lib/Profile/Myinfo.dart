import 'package:flutter/material.dart';
import 'package:spaceapp/datafile.dart';

import '../color.dart';

class Myinfo extends StatefulWidget {
  @override
  _MyinfoState createState() => _MyinfoState();
}

class _MyinfoState extends State<Myinfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          language ? '내 정보' : 'Myinfo',
          style: TextStyle(color: textcolor3, fontSize: 16),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 25,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  language ? '우주공간 정보 👽' : 'Space Information 👽',
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: textcolor2),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  language ? '핸드폰 번호' : 'Cell Phone Number',
                  style: TextStyle(fontSize: 12, color: field),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  phone,
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: textcolor2),
                ),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  onPressed: () {},
                  child: Container(
                    child: Center(
                        child: Text(
                      language ? '로그아웃' : 'Log Out',
                      style: TextStyle(fontSize: 16, color: containercolor),
                    )),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.2,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: containercolor),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'Withdrawal');
                  },
                  child: Text(
                    language ? '회원탈퇴' : 'Withdrawal',
                    style: TextStyle(
                      fontSize: 15,
                      color: textcolor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
