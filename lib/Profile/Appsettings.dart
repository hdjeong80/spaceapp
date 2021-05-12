import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../color.dart';
import '../datafile.dart';

class Appsettings extends StatefulWidget {
  @override
  _AppsettingsState createState() => _AppsettingsState();
}
bool toggle = false;
class _AppsettingsState extends State<Appsettings> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(language?'앱 설정':'App settings',style: TextStyle(color: Colors.black,fontSize: 16),),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,size: 30,),onPressed: (){
          Navigator.pop(context);
        },),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30,),
                Text(language?'알림 설정':'Notification settings',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Text(language?'푸시 알림 설정':'Set up push notifications',style: TextStyle(color: Colors.black,fontSize: 16),),
                    Spacer(),
                    Container(
                      child: Transform.scale(
                        scale: 0.8,
                        child: CupertinoSwitch(
                          value: UserNotification,
                          onChanged: (value) async{
                            setState(() {
                              UserNotification = value;

                            });
                            await instans.collection("Users")
                                .doc(userFirebaseID)
                                .update({
                              'pushonoff':UserNotification,

                            });
                          },
                          activeColor: containercolor,
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(),
                SizedBox(height: 20,),
                Text(language?'기타 정보':'Other information',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Text(language?'언어 설정':'Language setting',style: TextStyle(color: Colors.black,fontSize: 16),),
                    Spacer(),
                    InkWell(
                        onTap: (){
                          setState(() {
                            language=!language;
                          });
                        },
                        child: Text(language?'한국어':'Korean',style: TextStyle(color: containercolor,fontSize: 16),)),
                  ],
                ),
                SizedBox(height: 20,),
                Text(language?'캐시 데이터 삭제하기':'Clearing cache data',style: TextStyle(color: Colors.black,fontSize: 16),),
                SizedBox(height: 20,),
                Text(language?'현재 버전 1.0':'Current version 1.0',style: TextStyle(color: Colors.black,fontSize: 16),),
                SizedBox(height: 20,),
                Text(language?'서비스 이용 약관':'Terms of Service',style: TextStyle(color: Colors.black,fontSize: 16),),
                SizedBox(height: 20,),
                Text(language?'개인정보 처리방침':'Privacy Policy',style: TextStyle(color: Colors.black,fontSize: 16),),
                SizedBox(height: 20),
                Divider(),
                SizedBox(height: 15,),
                Text(language?'우주공간':'Outer space',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(height: 15,),
                Text(language?'공지사항':'Notice',style: TextStyle(color: Colors.black,fontSize: 16),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
