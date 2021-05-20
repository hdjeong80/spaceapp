import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:spaceapp/Deal/dealdefault.dart';
import 'package:spaceapp/Galaxy/default.dart';
import 'package:spaceapp/Profile/profile.dart';
import 'package:spaceapp/chat/chatdefault.dart';
import 'package:spaceapp/color.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../datafile.dart';
import 'dart:async';

import 'package:multi_image_picker/multi_image_picker.dart';

import 'feeddetail.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

List listItem = [
  'assets/mac.jpg',
  'assets/mac.jpg',
  'assets/mac.jpg',
  'assets/mac.jpg',
  'assets/mac.jpg',
];

void _launchURL(String _url) async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
int _selectedIndex = 0;

class _FeedState extends State<Feed> {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String _error = 'No Error Dectected';
  DateTime date;
  @override
  void initState() {
    super.initState();
    DateTime now = new DateTime.now();
    date = new DateTime(now.year, now.month, now.day);
  }

  Future<void> loadAssets() async {
    print("in function");
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 5,
        enableCamera: false,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          lightStatusBar: false,
          actionBarColor: "#FF6B81",
          actionBarTitle: "이미지 선택",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#FF6B81",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      _error = error;
      if (images.length != 0) Navigator.pushNamed(context, 'Upload');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        //backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? Image.asset(
                    'assets/icon1.png',
                    height: 25,
                    width: 25,
                  )
                : Image.asset(
                    'assets/icon11.png',
                    height: 25,
                    width: 25,
                  ),
            label: '탐험',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? Image.asset(
                    'assets/icon2_1.png',
                    height: 25,
                    width: 25,
                  )
                : Image.asset(
                    'assets/img2.png',
                    height: 25,
                    width: 25,
                  ),
            label: '거래',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? Image.asset(
                    'assets/icon3_1.png',
                    height: 25,
                    width: 25,
                  )
                : Image.asset(
                    'assets/img3.png',
                    height: 25,
                    width: 25,
                  ),
            label: '내 우주',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 3
                ? Image.asset(
                    'assets/icon4_1.png',
                    height: 25,
                    width: 25,
                  )
                : Image.asset(
                    'assets/img4.png',
                    height: 25,
                    width: 25,
                  ),
            label: '우주톡',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 4
                ? Image.asset(
                    'assets/img5_1.png',
                    height: 25,
                    width: 25,
                  )
                : Image.asset(
                    'assets/img5.png',
                    height: 25,
                    width: 25,
                  ),
            label: '프로필',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: containercolor,
        onTap: (index) {
          //print(index);
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      backgroundColor: bgcolor,
      floatingActionButton: FloatingActionButton(
        elevation: 0.0,
        onPressed: () {
          showDialog(
              context: context,
              builder: (dialogcontext) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  content: StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Text(
                              language ? '아이템 업로드' : 'Upload item',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: font1),
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
                                    Navigator.of(dialogcontext).pop();
                                  },
                                  child: Icon(Icons.close)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          language
                              ? '아이템 업로드를 위해 행성을 선택해주세요.'
                              : 'Please select a planet to upload items.',
                          style: TextStyle(fontSize: 15, fontFamily: font1),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(language ? '행성 선택' : 'Planet selection'),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 49.09,
                          width: MediaQuery.of(context).size.width / 1.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: textcolor.withOpacity(0.1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: DropdownButton(
                              dropdownColor: Colors.white,
                              iconSize: 36,
                              isExpanded: true,
                              underline: SizedBox(),
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                              value: valuechose2,
                              onChanged: (newValue) {
                                setState(() {
                                  for (int i = 0; i < listItem2.length; i++)
                                    if (listItem2[i] == newValue) {
                                      choseenindex = i;
                                      print("index");
                                      print(listItem2[i]);
                                      break;
                                    }

                                  valuechose2 = newValue;
                                });
                              },
                              items: listItem2.map((valueItem) {
                                return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(valueItem),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: RaisedButton(
                                child: Text(
                                  language ? '이미지 추가' : 'To explore',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: font1),
                                ),
                                onPressed: choseenindex == -1
                                    ? null
                                    : () {
                                        Navigator.pop(context);
                                        print("length of image :: " +
                                            images.length.toString());
                                        images = [];
                                        // Navigator.pushNamed(context, 'Upload');

                                        loadAssets();

                                        // Navigator.pushNamed(context, 'Upload');
                                      },
                                color: containercolor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                );
              });
        },
        child: Icon(Icons.add),
        backgroundColor: containercolor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      body: SafeArea(
        child: _selectedIndex == 0
            ? ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          // date.toString(),
                          '${date.year}년 ${date.month}월 ${date.day}일',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: font1,
                            color: Color(0xFFF7C7C7C),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          language ? '탐험하기 🚀' : 'Explore 🚀',
                          style: TextStyle(
                            fontSize: 23,
                            fontFamily: font1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CarouselSlider(
                    options: CarouselOptions(height: 135),
                    items: listItem.map((listitem) {
                      return Builder(
                        builder: (BuildContext context) {
                          return InkWell(
                            onTap: () {
                              print('helloooo');
                              _launchURL('https://www.google.com/');
                            },
                            // child: Container(
                            //   color: Color(0xFFF212F60),
                            //   child: Center(
                            //     child: Text('배너'),
                            //   ),
                            // ),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 3.0),
                              // color: Color(0xFFF212F60),
                              child: Center(
                                child: Text(
                                  '배너',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                              decoration: BoxDecoration(
                                // image: DecorationImage(
                                //   image: AssetImage(listitem),
                                //   fit: BoxFit.fill,
                                // ),
                                borderRadius: BorderRadius.circular(15),
                                color: buttoncolor,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  StreamBuilder(
                      stream: instans
                          .collection('Planets')
                          // .where('userid', isNotEqualTo: userFirebaseID)
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.data != null) if (snapshot.hasData)
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
                                                isEqualTo:
                                                    snapshot.data.docs[j].id)
                                            .snapshots(),
                                        builder: (BuildContext context,
                                            AsyncSnapshot<QuerySnapshot>
                                                snapshots1) {
                                          if (snapshots1.data !=
                                              null) if (snapshots1
                                                  .hasData &&
                                              !snapshot.data.docs[j]['private'])
                                            return Column(
                                              children: [
                                                for (int k = 0;
                                                    k <
                                                        snapshots1
                                                            .data.docs.length;
                                                    k++)
                                                  Column(
                                                    children: [
                                                      StreamBuilder(
                                                          stream: instans
                                                              .collection(
                                                                  'Users')
                                                              .where(
                                                                  'firebaseid',
                                                                  isEqualTo: snapshots1
                                                                          .data
                                                                          .docs[0]
                                                                      [
                                                                      'userID'])
                                                              .snapshots(),
                                                          builder: (BuildContext
                                                                  context,
                                                              AsyncSnapshot<
                                                                      QuerySnapshot>
                                                                  usersnap) {
                                                            if (usersnap
                                                                .hasData)
                                                              return Column(
                                                                children: [
                                                                  Container(
                                                                    margin: EdgeInsets.only(
                                                                        left:
                                                                            20,
                                                                        right:
                                                                            20),
                                                                    width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15),
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        SizedBox(
                                                                          height:
                                                                              5,
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            Container(
                                                                              margin: EdgeInsets.only(left: 15, top: 10, right: 10),
                                                                              child: usersnap.data.docs[0]['imageurl'] != null
                                                                                  ? CachedNetworkImage(
                                                                                      imageUrl: usersnap.data.docs[0]['imageurl'],
                                                                                      imageBuilder: (context, imageProvider) => Container(
                                                                                        width: 40,
                                                                                        height: 40,
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
                                                                                        width: 40,
                                                                                        height: 40,
                                                                                        child: Shimmer.fromColors(
                                                                                          baseColor: Colors.grey[200],
                                                                                          highlightColor: Colors.grey[350],
                                                                                          child: Container(
                                                                                            decoration: BoxDecoration(
                                                                                              shape: BoxShape.circle,
                                                                                              color: Colors.white,
                                                                                            ),
                                                                                            width: 40,
                                                                                            height: 40,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      errorWidget: (context, url, error) => Icon(Icons.person),
                                                                                    )
                                                                                  : Container(
                                                                                      width: 40,
                                                                                      height: 40,
                                                                                      child: Icon(
                                                                                        Icons.perm_identity,
                                                                                        color: Colors.white,
                                                                                        size: 20,
                                                                                      ),
                                                                                      decoration: BoxDecoration(shape: BoxShape.circle, color: containercolor),
                                                                                    ),
                                                                            ),
                                                                            Container(
                                                                              width: MediaQuery.of(context).size.width / 1.8,
                                                                              child: RichText(
                                                                                text: TextSpan(
                                                                                  text: usersnap.data.docs[0]['username'],
                                                                                  style: TextStyle(color: textcolor3, fontSize: 15, fontFamily: font1, fontWeight: FontWeight.bold),
                                                                                  children: <TextSpan>[
                                                                                    TextSpan(text: language ? ' 님의' : ' Of ', style: TextStyle(fontFamily: font1, fontSize: 16, color: textcolor3, fontWeight: FontWeight.w100)),
                                                                                    TextSpan(text: snapshot.data.docs[j]['planetname'], style: TextStyle(fontFamily: font1, color: textcolor3, fontSize: 15, fontWeight: FontWeight.w100)),
                                                                                    TextSpan(text: language ? ' 행성' : ' planet', style: TextStyle(fontFamily: font1, color: textcolor3, fontSize: 16, fontWeight: FontWeight.w100)),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Spacer(),
                                                                            Padding(
                                                                              padding: EdgeInsets.only(right: 10, top: 10),
                                                                              child: InkWell(
                                                                                  onTap: () async {
                                                                                    //  print(snapshots1.data.docs[k].id);
                                                                                    //  idforclick=snapshots1.data.docs[k].id;
                                                                                    links = [];
                                                                                    print(snapshots1.data.docs[k].id);
                                                                                    await instans.collection("ProductImages").where('ProductID', isEqualTo: snapshots1.data.docs[k].id).get().then((value) {
                                                                                      for (int i = 0; i < value.docs.length; i++) {
                                                                                        print(value.docs[i]['URL']);
                                                                                        //links.add(value.docs[i]['URL']);
                                                                                        setState(() {
                                                                                          links.add(value.docs[i]['URL']);
                                                                                          //AssetImage('assets/mac.jpg'),
                                                                                        });
                                                                                      }
                                                                                    });
                                                                                    Navigator.push(
                                                                                      context,
                                                                                      MaterialPageRoute(builder: (context) => Detail(snapshots1.data.docs[k].id, usersnap.data.docs[0].id)),
                                                                                    );
                                                                                    //   Navigator.pushNamed(context, "Detail");
                                                                                  },
                                                                                  child: Image.asset(
                                                                                    'assets/More.png',
                                                                                    height: 45,
                                                                                    width: 40,
                                                                                  )),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.only(
                                                                              left: 20,
                                                                              right: 20),
                                                                          child:
                                                                              Divider(),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.only(
                                                                              left: 15,
                                                                              right: 15),
                                                                          child: Text(
                                                                              snapshots1.data.docs[k]['title'],
                                                                              style: TextStyle(fontFamily: font1, fontSize: 16, color: textcolor3)),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            StreamBuilder(
                                                                                stream: instans.collection('ProductImages').where('ProductID', isEqualTo: snapshots1.data.docs[k].id).snapshots(),
                                                                                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> imagesnapshot) {
                                                                                  if (imagesnapshot.hasData && imagesnapshot.data != null)
                                                                                    return Column(
                                                                                      children: [
                                                                                        CachedNetworkImage(
                                                                                          imageUrl: imagesnapshot.data.docs[0]['URL'],
                                                                                          imageBuilder: (context, imageProvider) => Container(
                                                                                            height: 196,
                                                                                            width: MediaQuery.of(context).size.width / 1.25,
                                                                                            decoration: BoxDecoration(
                                                                                              borderRadius: BorderRadius.circular(15),
                                                                                              color: Colors.white,
                                                                                              image: DecorationImage(
                                                                                                image: imageProvider,
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          placeholder: (context, url) => SizedBox(
                                                                                            height: 196,
                                                                                            width: MediaQuery.of(context).size.width / 1.25,
                                                                                            child: Shimmer.fromColors(
                                                                                              child: Container(
                                                                                                height: 196,
                                                                                                width: MediaQuery.of(context).size.width / 1.25,
                                                                                                decoration: BoxDecoration(
                                                                                                  borderRadius: BorderRadius.circular(15),
                                                                                                  color: Colors.white,
                                                                                                ),
                                                                                              ),
                                                                                              baseColor: Colors.grey[200],
                                                                                              highlightColor: Colors.grey[350],
                                                                                            ),
                                                                                          ),
                                                                                          errorWidget: (context, url, error) => Icon(Icons.error),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  else
                                                                                    return Column(
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        SizedBox(
                                                                                          height: 196,
                                                                                          width: MediaQuery.of(context).size.width / 1.25,
                                                                                          child: Shimmer.fromColors(
                                                                                            child: Container(
                                                                                              height: 196,
                                                                                              width: MediaQuery.of(context).size.width / 1.25,
                                                                                              decoration: BoxDecoration(
                                                                                                borderRadius: BorderRadius.circular(15),
                                                                                                color: Colors.white,
                                                                                              ),
                                                                                            ),
                                                                                            baseColor: Colors.grey[200],
                                                                                            highlightColor: Colors.grey[350],
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                }),
                                                                          ],
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.only(
                                                                              left: 20,
                                                                              right: 20),
                                                                          child:
                                                                              Divider(),
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 15),
                                                                              child: InkWell(
                                                                                  onTap: () {
                                                                                    Navigator.pushNamed(context, "Chat");
                                                                                  },
                                                                                  child: Image.asset(
                                                                                    'assets/chat.png',
                                                                                    height: 34,
                                                                                    width: 34,
                                                                                  )),
                                                                            ),
                                                                            Spacer(),
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(right: 10),
                                                                              child: Text(
                                                                                Jiffy(DateTime.parse(snapshots1.data.docs[k]['datetime'].toDate().toString())).fromNow(),
                                                                                style: TextStyle(fontFamily: font1, fontSize: 13, color: textcolor),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 20,
                                                                  )
                                                                ],
                                                              );
                                                            else
                                                              return Container();
                                                          }),
                                                    ],
                                                  ),
                                              ],
                                            );
                                          else
                                            return Container();
                                          else
                                            return Container();
                                        }),
                                  ],
                                ),
                            ],
                          );
                        else
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(child: CircularProgressIndicator()),
                            ],
                          );
                        else
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                  child: CircularProgressIndicator(
                                backgroundColor: Colors.black,
                              )),
                            ],
                          );
                      }),
                  SizedBox(
                    height: 30,
                  ),
                ],
              )
            : _selectedIndex == 1
                ? Deal()
                : _selectedIndex == 2
                    ? Default()
                    : _selectedIndex == 3
                        ? Chatdefault()
                        : Profile(),
      ),
    );
  }
}
