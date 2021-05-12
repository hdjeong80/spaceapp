import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Deal/chat.dart';
import 'Deal/dealdefault.dart';
import 'Deal/dealdetail.dart';
import 'Feed/feeddefault.dart';
import 'Feed/feeddetail.dart';
import 'Galaxy/Itemlist.dart';
import 'Galaxy/Upload.dart';
import 'Galaxy/category.dart';
import 'Galaxy/default.dart';
import 'Galaxy/galaxy7.dart';
import 'Galaxy/galaxy71.dart';
import 'Login/Mainpage.dart';
import 'Login/login.dart';
import 'Login/signin2.dart';
import 'Login/signin3.dart';
import 'Login/signin4.dart';
import 'Profile/Appsettings.dart';
import 'Profile/Editprofile.dart';
import 'Profile/Myinfo.dart';
import 'Profile/Notice.dart';
import 'Profile/Withdrawal.dart';
import 'Profile/profile.dart';
import 'SplashScreen1.dart';
import 'SplashScreen2.dart';
import 'chat/chatdefault.dart';
import 'chat/chatsettings.dart';

import 'Login/signin1.dart';
import 'datafile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences pref = await SharedPreferences.getInstance();
  var user = pref.getString('userid');
  //user="FuQPrrklf0aMxGsuZaaXkxj1GQl2";
  if (user != null) {
    userFirebaseID = user;
    instans
        .collection('Users')
        .where('firebaseid', isEqualTo: userFirebaseID)
        .get()
        .then((QuerySnapshot querydata) {
      if (querydata.docs.isNotEmpty) {
        // final allData = querydata.docs.map((doc) => doc.data()).toList();
        for (int i = 0; i < querydata.docs.length; i++) {
          var a = querydata.docs[i];
          phone = a.get('phone');
          uniqueuser = a.get('username');
          address = a.get('address');
          UserImage = a.get('imageurl');
          UserAbout = a.get('about');
          UserNotification = a.get('pushonoff');
        }
      }
    });
    instans
        .collection('Planets')
        .where('userid', isEqualTo: userFirebaseID)
        .get()
        .then((QuerySnapshot querydata) {
      if (querydata.docs.isNotEmpty) {
        // final allData = querydata.docs.map((doc) => doc.data()).toList();
        for (int i = 0; i < querydata.docs.length; i++) {
          listItem2.add(querydata.docs[i]['planetname'].toString());
          listItem2Ids.add(querydata.docs[i].id);
          print(querydata.docs[i]['planetname'].toString());
        }
      }
    });
  }
  print(userFirebaseID);
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(MaterialApp(
            title: '우주공간',
            debugShowCheckedModeBanner: false,
            home: user == null ? SpalshScreen2() : SpalshScreen1(),
            routes: {
              "Login": (context) => Login(),
              "Signin1": (context) => Signin1(),
              "Signin2": (context) => Signin2(),
              "Signin3": (context) => Signin3(),
              "Signin4": (context) => Signin4(),
              "Feed": (context) => Feed(),
              "Deal": (context) => Deal(),
              "Chat": (context) => Chat(),
              "Default": (context) => Default(),
              "Upload": (context) => Upload(),
              "Category": (context) => Category(),
              "Dealdetail": (context) => Dealdetail(),
              "Galaxy7": (context) => Galaxy7(),
              "Galaxy71": (context) => Galaxy71(),
              // "Itemlist": (context) => Itemlist(),
              "Chatdefault": (context) => Chatdefault(),
              "Chatsettings": (context) => Chatsettings(),
              "Profile": (context) => Profile(),
              "Myinfo": (context) => Myinfo(),
              "Withdrawal": (context) => Withdrawal(),
              "Notice": (context) => Notice(),
              "Editprofile": (context) => Editprofile(),
              "Appsettings": (context) => Appsettings(),
            },
          )));
}
