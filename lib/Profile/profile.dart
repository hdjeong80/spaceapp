import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:spaceapp/color.dart';
import 'package:shimmer/shimmer.dart';

import '../datafile.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          /* IconButton(
            icon: Image.asset('assets/bell.png',height: 18,width: 18,),
            onPressed: (){
              Navigator.pushNamed(context, 'Notice');
            },
          ),*/
          IconButton(
            icon: Image.asset(
              'assets/setting.png',
              height: 20,
              width: 20,
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => Container(
                  height: 205,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          //width: MediaQuery.of(context).size.width/2,
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 2.3,
                              right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                language ? '설정' : 'Setting',
                                style: TextStyle(
                                    fontFamily: font1,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19,
                                    color: textcolor3),
                              ),
                              Spacer(),
                              Container(
                                height: 36.17,
                                width: 36.17,
                                decoration: BoxDecoration(
                                  color: buttoncolor2,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Icon(Icons.close)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, 'Myinfo');
                            },
                            child: Text(
                              language ? '내 정보' : 'My Info',
                              style: TextStyle(
                                  fontFamily: font1,
                                  fontSize: 16,
                                  color: Colors.black),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.pushNamed(context, 'Editprofile');
                            },
                            child: Text(
                              language ? '프로필 수정' : 'Edit Profile',
                              style: TextStyle(
                                  fontFamily: font1,
                                  fontSize: 16,
                                  color: Colors.black),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, 'Appsettings');
                            },
                            child: Text(
                              language ? '앱 설정' : 'App settings',
                              style: TextStyle(
                                  fontFamily: font1,
                                  fontSize: 16,
                                  color: Colors.black),
                            )),
                      ]),
                ),
                backgroundColor: Colors.transparent,
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          UserImage == null
              ? Center(
                  child: Image.asset(
                  'assets/profileimg.png',
                  height: 101,
                  width: 101,
                ))
              : Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 5.0,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: CachedNetworkImage(
                      imageUrl: UserImage,
                      imageBuilder: (context, imageProvider) => Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        width: 100,
                        height: 100,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[200],
                          highlightColor: Colors.grey[350],
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          Icon(Icons.perm_identity),
                    ),
                  ),
                ),
          SizedBox(
            height: 10,
          ),
          Text(
            uniqueuser != null ? uniqueuser : '이름 없음',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontFamily: font1,
                color: textcolor3),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: Text(
                address != null ? address : "주소 없음",
                style: TextStyle(
                    fontSize: 15, fontFamily: font1, color: textcolor3),
              )),
          SizedBox(
            height: 50,
          ),
          Expanded(
            child: Container(
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20.0),
                        alignment: Alignment.topCenter,
                        height: MediaQuery.of(context).size.height / 1,
                        color: Colors.transparent,
                        child: new Container(
                          decoration: new BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.only(
                                topLeft: const Radius.circular(40.0),
                                topRight: const Radius.circular(40.0),
                              )),
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Container(
                              alignment: Alignment.topCenter,
                              width: MediaQuery.of(context).size.width / 1.1,
                              decoration: BoxDecoration(
                                color: buttoncolor2,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      language ? '내 소개' : 'About me',
                                      style: TextStyle(
                                          fontFamily: font1,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: textcolor3),
                                    ),
                                    Text(
                                      UserAbout != null ? UserAbout : '',
                                      style: TextStyle(
                                          fontFamily: font1,
                                          fontSize: 16,
                                          color: textcolor3),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          StreamBuilder(
                              stream: instans
                                  .collection('Planets')
                                  .where('userid', isEqualTo: userFirebaseID)
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (snapshot.hasData && snapshot.data != null)
                                  return Column(
                                    children: [
                                      for (int j = 0;
                                          j < snapshot.data.docs.length;
                                          j++)
                                        Column(
                                          children: [
                                            StreamBuilder(
                                                stream: instans
                                                    .collection('Products')
                                                    .where('categoryID',
                                                        isEqualTo: snapshot
                                                            .data.docs[j].id)
                                                    .snapshots(),
                                                builder: (BuildContext context,
                                                    AsyncSnapshot<QuerySnapshot>
                                                        productsnapshot) {
                                                  if (productsnapshot.data !=
                                                          null &&
                                                      productsnapshot.data.docs
                                                              .length >
                                                          0) if (productsnapshot
                                                      .hasData)
                                                    return Column(
                                                      children: [
                                                        StreamBuilder(
                                                            stream: instans
                                                                .collection(
                                                                    'ProductImages')
                                                                .where(
                                                                    'ProductID',
                                                                    isEqualTo:
                                                                        productsnapshot
                                                                            .data
                                                                            .docs[
                                                                                0]
                                                                            .id)
                                                                .snapshots(),
                                                            builder: (BuildContext
                                                                    context,
                                                                AsyncSnapshot<
                                                                        QuerySnapshot>
                                                                    imagesnapshop) {
                                                              if (imagesnapshop
                                                                      .data !=
                                                                  null) if (imagesnapshop.hasData)
                                                                return Column(
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          left:
                                                                              20),
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            181,
                                                                        width: MediaQuery.of(context).size.width /
                                                                            1.1,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          image: DecorationImage(
                                                                              image: NetworkImage(imagesnapshop.data.docs[0]['URL']),
                                                                              fit: BoxFit.cover),
                                                                          color:
                                                                              buttoncolor2,
                                                                          borderRadius:
                                                                              BorderRadius.circular(20),
                                                                        ),
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsets.only(right: 20, top: 10),
                                                                                  child: snapshot.data.docs[j]['private']
                                                                                      ? Image.asset(
                                                                                          'assets/lock.png',
                                                                                          height: 23,
                                                                                          width: 23,
                                                                                        )
                                                                                      : Image.asset(
                                                                                          'assets/Unlock.png',
                                                                                          height: 23,
                                                                                          width: 23,
                                                                                        ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Spacer(),
                                                                            Container(
                                                                              height: 50,
                                                                              width: MediaQuery.of(context).size.width / 1.3,
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(15),
                                                                                child: RaisedButton(
                                                                                  child: RichText(
                                                                                    text: TextSpan(
                                                                                      text: snapshot.data.docs[j]['planetname'],
                                                                                      style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: font1, fontWeight: FontWeight.bold),
                                                                                      children: <TextSpan>[
                                                                                        TextSpan(text: language ? ' 행성   ' : ' planet   ', style: TextStyle(fontFamily: font1, fontSize: 15, color: Colors.white, fontWeight: FontWeight.w100)),
                                                                                        TextSpan(text: language ? '1개' : 'One', style: TextStyle(fontFamily: font1, color: Colors.white, fontSize: 15, fontWeight: FontWeight.w100)),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  onPressed: () {
                                                                                    //    Navigator.pushNamed(context, "Gender");
                                                                                  },
                                                                                  color: Colors.black.withOpacity(0.5),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                );
                                                              else
                                                                return Container();
                                                              else
                                                                return Column(
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          left:
                                                                              20),
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            181,
                                                                        width: MediaQuery.of(context).size.width /
                                                                            1.1,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.grey,
                                                                          borderRadius:
                                                                              BorderRadius.circular(20),
                                                                        ),
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsets.only(right: 20, top: 10),
                                                                                  child: snapshot.data.docs[j]['private']
                                                                                      ? Image.asset(
                                                                                          'assets/lock.png',
                                                                                          height: 23,
                                                                                          width: 23,
                                                                                        )
                                                                                      : Image.asset(
                                                                                          'assets/Unlock.png',
                                                                                          height: 23,
                                                                                          width: 23,
                                                                                        ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Spacer(),
                                                                            Container(
                                                                              height: 50,
                                                                              width: MediaQuery.of(context).size.width / 1.3,
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(15),
                                                                                child: RaisedButton(
                                                                                  child: RichText(
                                                                                    text: TextSpan(
                                                                                      text: snapshot.data.docs[j]['planetname'],
                                                                                      style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: font1, fontWeight: FontWeight.bold),
                                                                                      children: <TextSpan>[
                                                                                        TextSpan(text: language ? ' 행성   ' : ' planet   ', style: TextStyle(fontFamily: font1, fontSize: 15, color: Colors.white, fontWeight: FontWeight.w100)),
                                                                                        TextSpan(text: language ? '1개' : 'One', style: TextStyle(fontFamily: font1, color: Colors.white, fontSize: 15, fontWeight: FontWeight.w100)),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  onPressed: () {
                                                                                    //    Navigator.pushNamed(context, "Gender");
                                                                                  },
                                                                                  color: Colors.black.withOpacity(0.5),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                );
                                                            }),
                                                      ],
                                                    );
                                                  else
                                                    return Container();
                                                  else
                                                    return Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 20),
                                                          child: Container(
                                                            height: 181,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                1.1,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.grey,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                            ),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          right:
                                                                              20,
                                                                          top:
                                                                              10),
                                                                      child: snapshot.data.docs[j]
                                                                              [
                                                                              'private']
                                                                          ? Image
                                                                              .asset(
                                                                              'assets/lock.png',
                                                                              height: 23,
                                                                              width: 23,
                                                                            )
                                                                          : Image
                                                                              .asset(
                                                                              'assets/Unlock.png',
                                                                              height: 23,
                                                                              width: 23,
                                                                            ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Spacer(),
                                                                Container(
                                                                  height: 50,
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      1.3,
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                    child:
                                                                        RaisedButton(
                                                                      child:
                                                                          RichText(
                                                                        text:
                                                                            TextSpan(
                                                                          text: snapshot
                                                                              .data
                                                                              .docs[j]['planetname'],
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 15,
                                                                              fontFamily: font1,
                                                                              fontWeight: FontWeight.bold),
                                                                          children: <
                                                                              TextSpan>[
                                                                            TextSpan(
                                                                                text: language ? ' 행성   ' : ' planet   ',
                                                                                style: TextStyle(fontFamily: font1, fontSize: 15, color: Colors.white, fontWeight: FontWeight.w100)),
                                                                            TextSpan(
                                                                                text: language ? '1개' : 'One',
                                                                                style: TextStyle(fontFamily: font1, color: Colors.white, fontSize: 15, fontWeight: FontWeight.w100)),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      onPressed:
                                                                          () {
                                                                        //    Navigator.pushNamed(context, "Gender");
                                                                      },
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              0.5),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                }),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                    ],
                                  );
                                else
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                          child: Center(
                                              child:
                                                  CircularProgressIndicator())),
                                    ],
                                  );
                              }),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
