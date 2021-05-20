import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:spaceapp/Feed/feeddetail.dart';
import 'package:spaceapp/color.dart';
import 'package:shimmer/shimmer.dart';

import '../datafile.dart';

class Deal extends StatefulWidget {
  @override
  _DealState createState() => _DealState();
}

class _DealState extends State<Deal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: const Icon(Icons.add),
        backgroundColor: containercolor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                language ? '거래 🛰' : 'Deal 🛰',
                style: TextStyle(
                    fontSize: 23,
                    fontFamily: font1,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: 30,
            ),

            //SizedBox(height: 10,),
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
                        for (int j = 0; j < snapshot.data.docs.length; j++)
                          Column(
                            children: [
                              StreamBuilder(
                                  stream: instans
                                      .collection('Products')
                                      .where('categoryID',
                                          isEqualTo: snapshot.data.docs[j].id)
                                      .snapshots(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<QuerySnapshot> snapshots1) {
                                    if (snapshots1.data != null) if (snapshots1
                                            .hasData &&
                                        !snapshot.data.docs[j]['private'])
                                      return Column(
                                        children: [
                                          for (int k = 0;
                                              k < snapshots1.data.docs.length;
                                              k++)
                                            Column(
                                              children: [
                                                StreamBuilder(
                                                    stream: instans
                                                        .collection('Users')
                                                        .where('firebaseid',
                                                            isEqualTo:
                                                                snapshots1.data
                                                                        .docs[0]
                                                                    ['userID'])
                                                        .snapshots(),
                                                    builder: (BuildContext
                                                            context,
                                                        AsyncSnapshot<
                                                                QuerySnapshot>
                                                            usersnap) {
                                                      if (usersnap.hasData &&
                                                          snapshots1
                                                                  .data.docs[k]
                                                              ['transaction'])
                                                        return Column(
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left: 20,
                                                                      right:
                                                                          20),
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15),
                                                              ),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        margin: EdgeInsets.only(
                                                                            left:
                                                                                15,
                                                                            top:
                                                                                10,
                                                                            right:
                                                                                10),
                                                                        child: usersnap.data.docs[0]['imageurl'] !=
                                                                                null
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
                                                                        margin:
                                                                            EdgeInsets.only(
                                                                          top:
                                                                              15,
                                                                        ),
                                                                        width: MediaQuery.of(context).size.width /
                                                                            1.75,
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            RichText(
                                                                              text: TextSpan(
                                                                                text: usersnap.data.docs[0]['username'] + ' ',
                                                                                style: TextStyle(color: textcolor3, fontSize: 15, fontFamily: font1, fontWeight: FontWeight.bold),
                                                                                children: <TextSpan>[
                                                                                  TextSpan(text: language ? '님의' : 'Of ', style: TextStyle(fontFamily: font1, fontSize: 16, color: textcolor3)),
                                                                                  TextSpan(text: snapshot.data.docs[j]['planetname'], style: TextStyle(fontFamily: font1, color: textcolor3, fontSize: 15)),
                                                                                  // TextSpan(text: language?  '행성':'planet', style: TextStyle( fontFamily: font1, color: textcolor3,fontSize: 16)),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Text(snapshots1.data.docs[k]['title'],
                                                                                style: TextStyle(fontFamily: font1, fontSize: 16, color: Colors.black)),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Spacer(),
                                                                      Padding(
                                                                        padding: EdgeInsets.only(
                                                                            right:
                                                                                10,
                                                                            top:
                                                                                10),
                                                                        child: InkWell(
                                                                            onTap: () {},
                                                                            child: InkWell(
                                                                                onTap: () async {
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
                                                                                },
                                                                                child: Image.asset(
                                                                                  'assets/More.png',
                                                                                  height: 40,
                                                                                  width: 40,
                                                                                ))),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            20,
                                                                        right:
                                                                            20),
                                                                    child:
                                                                        Divider(),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            20),
                                                                    child: Row(
                                                                      children: [
                                                                        StreamBuilder(
                                                                            stream:
                                                                                instans.collection('ProductImages').where('ProductID', isEqualTo: snapshots1.data.docs[k].id).snapshots(),
                                                                            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> imagesnapshot) {
                                                                              if (imagesnapshot.hasData && imagesnapshot.data != null)
                                                                                return Column(
                                                                                  children: [
                                                                                    CachedNetworkImage(
                                                                                      imageUrl: imagesnapshot.data.docs[0]['URL'],
                                                                                      imageBuilder: (context, imageProvider) => Container(
                                                                                        height: 74,
                                                                                        width: MediaQuery.of(context).size.width / 4,
                                                                                        decoration: BoxDecoration(
                                                                                          borderRadius: BorderRadius.circular(15),
                                                                                          color: Colors.white,
                                                                                          image: DecorationImage(
                                                                                            image: imageProvider,
                                                                                            fit: BoxFit.cover,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      placeholder: (context, url) => Container(
                                                                                        decoration: BoxDecoration(
                                                                                          borderRadius: BorderRadius.circular(15),
                                                                                          color: Colors.white,
                                                                                        ),
                                                                                        height: 74,
                                                                                        width: MediaQuery.of(context).size.width / 4,
                                                                                        child: Shimmer.fromColors(
                                                                                          baseColor: Colors.grey[200],
                                                                                          highlightColor: Colors.grey[350],
                                                                                          child: Container(
                                                                                            decoration: BoxDecoration(
                                                                                              borderRadius: BorderRadius.circular(15),
                                                                                              color: Colors.white,
                                                                                            ),
                                                                                            height: 74,
                                                                                            width: MediaQuery.of(context).size.width / 4,
                                                                                          ),
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
                                                                                    Container(
                                                                                      decoration: BoxDecoration(
                                                                                        borderRadius: BorderRadius.circular(15),
                                                                                        color: Colors.white,
                                                                                      ),
                                                                                      height: 74,
                                                                                      width: MediaQuery.of(context).size.width / 4,
                                                                                      child: Shimmer.fromColors(
                                                                                        baseColor: Colors.grey[200],
                                                                                        highlightColor: Colors.grey[350],
                                                                                        child: Container(
                                                                                          decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(15),
                                                                                            color: Colors.white,
                                                                                          ),
                                                                                          height: 74,
                                                                                          width: MediaQuery.of(context).size.width / 4,
                                                                                        ),
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                );
                                                                            }),
                                                                        SizedBox(
                                                                          width:
                                                                              20,
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width / 2,
                                                                          child:
                                                                              Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(snapshots1.data.docs[k]['title'], style: TextStyle(fontFamily: font1, fontSize: 16, color: Colors.black)),
                                                                              Text(snapshots1.data.docs[k]['price'] != null ? snapshots1.data.docs[k]['price'].toString() + ' 원' : '가격 없음', style: TextStyle(fontFamily: font1, fontSize: 16, color: textcolor3, fontWeight: FontWeight.bold)),
                                                                              Row(
                                                                                children: [
                                                                                  RichText(
                                                                                    text: TextSpan(
                                                                                      text: language ? '거래제안 ' : 'Transaction Proposal ',
                                                                                      style: TextStyle(
                                                                                        color: textcolor3,
                                                                                        fontSize: 15,
                                                                                        fontFamily: font1,
                                                                                      ),
                                                                                      children: <TextSpan>[
                                                                                        TextSpan(text: snapshots1.data.docs[k]['transaction'] ? 'ON' : 'OFF', style: TextStyle(fontFamily: font1, fontSize: 16, color: containercolor)),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
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
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey[200],
                            highlightColor: Colors.grey[350],
                            child: Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                }),
          ],
        ),
      ),
    );
  }
}
