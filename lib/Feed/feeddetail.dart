import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:spaceapp/color.dart';
import 'package:spaceapp/datafile.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shimmer/shimmer.dart';

class Detail extends StatefulWidget {
  String productid;
  String userID;
  Detail(String productid, String userID) {
    this.productid = productid;
    this.userID = userID;
  }
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // instans.collection('Users').where('firebaseid',isEqualTo: snapshots1.data.docs[0]['userID']).snapshots();
//    CollectionReference _documentRef=instans.collection("ProductImages").where('ProductID',isEqualTo: idforclick);
//
//    _documentRef.doc().get().then((ds){
//      if(ds!=null){
//
//      }
//    });ㅈ
  }

  @override
  Widget build(BuildContext context) {
    Widget image_slider_carousel = Container(
      height: 347,
      width: MediaQuery.of(context).size.width,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: links
            .map((item) => Container(
                  child: CachedNetworkImage(
                    imageUrl: item,
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
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ))
            .toList(),
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
      body: StreamBuilder(
          stream: instans
              .collection('Users')
              .where('firebaseid', isEqualTo: widget.userID)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> usersnap) {
            if (usersnap.hasData)
              return StreamBuilder(
                  stream: instans
                      .collection('Products')
                      .doc(widget.productid)
                      .snapshots(),
                  builder: (BuildContext context, productsnapshot) {
                    if (productsnapshot.hasData)
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              image_slider_carousel,
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 40, left: 10),
                                    child: IconButton(
                                        icon: Icon(
                                          Icons.arrow_back,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                        onPressed: () =>
                                            Navigator.pop(context)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Expanded(
                            child: ListView(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 10, right: 10),
                                            child: usersnap.data.docs[0]
                                                        ['imageurl'] !=
                                                    null
                                                ? CachedNetworkImage(
                                                    imageUrl: usersnap.data
                                                        .docs[0]['imageurl'],
                                                    imageBuilder: (context,
                                                            imageProvider) =>
                                                        Container(
                                                      width: 40,
                                                      height: 40,
                                                      // margin: EdgeInsets.only(top: 20, right:),
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.white,
                                                        image: DecorationImage(
                                                          image: imageProvider,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    placeholder:
                                                        (context, url) =>
                                                            Container(
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.white,
                                                      ),
                                                      width: 40,
                                                      height: 40,
                                                      child: Shimmer.fromColors(
                                                        baseColor:
                                                            Colors.grey[200],
                                                        highlightColor:
                                                            Colors.grey[350],
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: Colors.white,
                                                          ),
                                                          width: 40,
                                                          height: 40,
                                                        ),
                                                      ),
                                                    ),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            Icon(Icons.person),
                                                  )
                                                : Container(
                                                    width: 40,
                                                    height: 40,
                                                    // margin: EdgeInsets.only(top: 20),
                                                    child: Icon(
                                                      Icons.perm_identity,
                                                      color: Colors.white,
                                                      size: 20,
                                                    ),
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: containercolor),
                                                  ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 20),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
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
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text: language
                                                              ? '님의'
                                                              : 'Of ',
                                                          style: TextStyle(
                                                              fontFamily: font1,
                                                              fontSize: 16,
                                                              color:
                                                                  textcolor3)),
                                                      TextSpan(
                                                          text: language
                                                              ? '테크우주'
                                                              : 'Tech Universe \n ',
                                                          style: TextStyle(
                                                              fontFamily: font1,
                                                              color: textcolor3,
                                                              fontSize: 15)),
                                                      TextSpan(
                                                          text: language
                                                              ? '행성'
                                                              : 'planet',
                                                          style: TextStyle(
                                                              fontFamily: font1,
                                                              color: textcolor3,
                                                              fontSize: 16)),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      70,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        usersnap.data.docs[0]
                                                            ['username'],
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            fontFamily: font1,
                                                            color: textcolor),
                                                      ),
                                                      Spacer(),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 20),
                                                        child: Text(
                                                          Jiffy(DateTime.parse(
                                                                  productsnapshot
                                                                      .data[
                                                                          'datetime']
                                                                      .toDate()
                                                                      .toString()))
                                                              .fromNow(),
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              fontFamily: font1,
                                                              color:
                                                                  tetxcolor4),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
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
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: Divider(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    productsnapshot.data['title'],
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
                                    productsnapshot.data['detail'],
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: font1,
                                        color: textcolor3),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
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
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: Column(
                                    children: [
                                      productsnapshot.data['price'] != ""
                                          ? Row(
                                              children: [
                                                Image.asset(
                                                  'assets/circle.png',
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  language ? '가격' : 'Price',
                                                  style: TextStyle(
                                                      fontFamily: font1,
                                                      color: textcolor,
                                                      fontSize: 15),
                                                ),
                                                SizedBox(
                                                  width: 100,
                                                ),
                                                Text(
                                                  productsnapshot.data['price'],
                                                  style: TextStyle(
                                                      fontFamily: font1,
                                                      color: textcolor3,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            )
                                          : Container(),
                                      productsnapshot.data['price'] != ""
                                          ? SizedBox(
                                              height: 10,
                                            )
                                          : Container(),
                                      productsnapshot.data['brand'] != ""
                                          ? Row(
                                              children: [
                                                Image.asset(
                                                  'assets/circle.png',
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  language ? '상표' : 'Brand',
                                                  style: TextStyle(
                                                      fontFamily: font1,
                                                      color: textcolor,
                                                      fontSize: 15),
                                                ),
                                                SizedBox(
                                                  width: 91,
                                                ),
                                                Text(
                                                  productsnapshot.data['brand'],
                                                  style: TextStyle(
                                                      fontFamily: font1,
                                                      color: textcolor3,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            )
                                          : Container(),
                                      productsnapshot.data['brand'] != "" ||
                                              productsnapshot.data['price'] !=
                                                  ""
                                          ? SizedBox(
                                              height: 10,
                                            )
                                          : Container(),
                                      productsnapshot.data['quantity'] != ""
                                          ? Row(
                                              children: [
                                                Image.asset(
                                                  'assets/circle.png',
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  language ? '수량' : 'Quantity',
                                                  style: TextStyle(
                                                      fontFamily: font1,
                                                      color: textcolor,
                                                      fontSize: 15),
                                                ),
                                                SizedBox(
                                                  width: 70,
                                                ),
                                                Text(
                                                  productsnapshot
                                                      .data['quantity'],
                                                  style: TextStyle(
                                                      fontFamily: font1,
                                                      color: textcolor3,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            )
                                          : Container(),
                                      productsnapshot.data['brand'] != "" ||
                                              productsnapshot.data['price'] !=
                                                  "" ||
                                              productsnapshot
                                                      .data['quantity'] !=
                                                  ""
                                          ? SizedBox(
                                              height: 10,
                                            )
                                          : Container(),
                                      productsnapshot.data['purchasedate'] != ""
                                          ? Row(
                                              children: [
                                                Image.asset(
                                                  'assets/circle.png',
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  language
                                                      ? '구매 날짜'
                                                      : 'Purchase date',
                                                  style: TextStyle(
                                                      fontFamily: font1,
                                                      color: textcolor,
                                                      fontSize: 15),
                                                ),
                                                SizedBox(
                                                  width: 25,
                                                ),
                                                Text(
                                                  productsnapshot
                                                      .data['purchasedate'],
                                                  style: TextStyle(
                                                      fontFamily: font1,
                                                      color: textcolor3,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            )
                                          : Container(),
                                      productsnapshot.data['purchasedate'] != ""
                                          ? SizedBox(
                                              height: 10,
                                            )
                                          : Container(),
                                      productsnapshot.data['wheretobuy'] != ""
                                          ? Row(
                                              children: [
                                                Image.asset(
                                                  'assets/circle.png',
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  language
                                                      ? '구입처'
                                                      : 'Where to buy',
                                                  style: TextStyle(
                                                      fontFamily: font1,
                                                      color: textcolor,
                                                      fontSize: 15),
                                                ),
                                                SizedBox(
                                                  width: 33,
                                                ),
                                                Text(
                                                  productsnapshot
                                                      .data['wheretobuy'],
                                                  style: TextStyle(
                                                      fontFamily: font1,
                                                      color: textcolor3,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            )
                                          : Container(),
                                      productsnapshot.data['wheretobuy'] != ""
                                          ? SizedBox(
                                              height: 10,
                                            )
                                          : Container(),
                                      productsnapshot.data['modelname'] != ""
                                          ? Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                      'assets/circle.png',
                                                      height: 30,
                                                      width: 30,
                                                    ),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Text(
                                                      language
                                                          ? '모델명'
                                                          : 'Model name',
                                                      style: TextStyle(
                                                          fontFamily: font1,
                                                          color: textcolor,
                                                          fontSize: 15),
                                                    ),
                                                    SizedBox(
                                                      width: 37,
                                                    ),
                                                    Text(
                                                      productsnapshot
                                                          .data['modelname'],
                                                      style: TextStyle(
                                                          fontFamily: font1,
                                                          color: textcolor3,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            )
                                          : Container(),
                                      productsnapshot.data['area'] != ""
                                          ? Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                      'assets/circle.png',
                                                      height: 30,
                                                      width: 30,
                                                    ),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Text(
                                                      language ? '지역' : 'area',
                                                      style: TextStyle(
                                                          fontFamily: font1,
                                                          color: textcolor,
                                                          fontSize: 15),
                                                    ),
                                                    SizedBox(
                                                      width: 98,
                                                    ),
                                                    Text(
                                                      productsnapshot
                                                          .data['area'],
                                                      style: TextStyle(
                                                          fontFamily: font1,
                                                          color: textcolor3,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            )
                                          : Container(),
                                      productsnapshot.data['productno'] != ""
                                          ? Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                      'assets/circle.png',
                                                      height: 30,
                                                      width: 30,
                                                    ),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Text(
                                                      language
                                                          ? '제품번호'
                                                          : 'product no',
                                                      style: TextStyle(
                                                          fontFamily: font1,
                                                          color: textcolor,
                                                          fontSize: 15),
                                                    ),
                                                    SizedBox(
                                                      width: 45,
                                                    ),
                                                    Text(
                                                      productsnapshot
                                                          .data['productno'],
                                                      style: TextStyle(
                                                          fontFamily: font1,
                                                          color: textcolor3,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 25,
                                                ),
                                              ],
                                            )
                                          : Container(),
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
                                    showModalBottomSheet(
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (context) => Container(
                                        // height: 300,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30),
                                              topRight: Radius.circular(30),
                                            )),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20, top: 20),
                                              child: Text(
                                                language
                                                    ? '제안하기'
                                                    : 'Make a Suggestion',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: font1,
                                                    fontSize: 19,
                                                    color: textcolor3),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 40, right: 40),
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: textcolor),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: containercolor),
                                                  ),
                                                  hintText: language
                                                      ? '제안가격'
                                                      : "Suggested price",
                                                  hintStyle: TextStyle(
                                                      color: textcolor,
                                                      fontSize: 16,
                                                      fontFamily: font1),
                                                  suffixText: language
                                                      ? '원(₩)'
                                                      : "Won (₩)",
                                                  suffixStyle: TextStyle(
                                                      color: containercolor,
                                                      fontSize: 15,
                                                      fontFamily: font1),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 40, right: 40),
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: textcolor),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: containercolor),
                                                  ),
                                                  hintText: language
                                                      ? '서울특별시 마곡동'
                                                      : 'Magok-dong, Seoul',
                                                  hintStyle: TextStyle(
                                                      color: textcolor,
                                                      fontSize: 16,
                                                      fontFamily: font1),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  height: 50,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.5,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                    child: RaisedButton(
                                                      child: Text(
                                                        language
                                                            ? '취소'
                                                            : 'Cancel',
                                                        style: TextStyle(
                                                            color: modalbutton,
                                                            fontSize: 16,
                                                            fontFamily: font1),
                                                      ),
                                                      onPressed: () {
                                                        //    Navigator.pushNamed(context, "Gender");
                                                      },
                                                      color: modal,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 50,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.5,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                    child: RaisedButton(
                                                      child: Text(
                                                        language
                                                            ? '제안'
                                                            : 'Suggestion',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                            fontFamily: font1),
                                                      ),
                                                      onPressed: () {
                                                        //    Navigator.pushNamed(context, "Gender");
                                                      },
                                                      color: containercolor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                          ],
                                        ),
                                      ),
                                      backgroundColor: Colors.transparent,
                                    );
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
                                  onPressed: () {},
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
                      );
                    return ListView(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 196,
                          width: MediaQuery.of(context).size.width,
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
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 90,
                          width: MediaQuery.of(context).size.width,
                          child: Shimmer.fromColors(
                            child: Container(
                              height: 196,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                            ),
                            baseColor: Colors.grey[200],
                            highlightColor: Colors.grey[350],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 90,
                          width: MediaQuery.of(context).size.width,
                          child: Shimmer.fromColors(
                            child: Container(
                              height: 196,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                            ),
                            baseColor: Colors.grey[200],
                            highlightColor: Colors.grey[350],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 90,
                          width: MediaQuery.of(context).size.width,
                          child: Shimmer.fromColors(
                            child: Container(
                              height: 196,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                            ),
                            baseColor: Colors.grey[200],
                            highlightColor: Colors.grey[350],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 90,
                          width: MediaQuery.of(context).size.width,
                          child: Shimmer.fromColors(
                            child: Container(
                              height: 196,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                            ),
                            baseColor: Colors.grey[200],
                            highlightColor: Colors.grey[350],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 90,
                          width: MediaQuery.of(context).size.width,
                          child: Shimmer.fromColors(
                            child: Container(
                              height: 196,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                            ),
                            baseColor: Colors.grey[200],
                            highlightColor: Colors.grey[350],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 90,
                          width: MediaQuery.of(context).size.width,
                          child: Shimmer.fromColors(
                            child: Container(
                              height: 196,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                            ),
                            baseColor: Colors.grey[200],
                            highlightColor: Colors.grey[350],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 90,
                          width: MediaQuery.of(context).size.width,
                          child: Shimmer.fromColors(
                            child: Container(
                              height: 196,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                            ),
                            baseColor: Colors.grey[200],
                            highlightColor: Colors.grey[350],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 90,
                          width: MediaQuery.of(context).size.width,
                          child: Shimmer.fromColors(
                            child: Container(
                              height: 196,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                            ),
                            baseColor: Colors.grey[200],
                            highlightColor: Colors.grey[350],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 90,
                          width: MediaQuery.of(context).size.width,
                          child: Shimmer.fromColors(
                            child: Container(
                              height: 196,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                            ),
                            baseColor: Colors.grey[200],
                            highlightColor: Colors.grey[350],
                          ),
                        ),
                      ],
                    );
                  });
            else
              return ListView(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 196,
                    width: MediaQuery.of(context).size.width,
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
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 90,
                    width: MediaQuery.of(context).size.width,
                    child: Shimmer.fromColors(
                      child: Container(
                        height: 196,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                      baseColor: Colors.grey[200],
                      highlightColor: Colors.grey[350],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 90,
                    width: MediaQuery.of(context).size.width,
                    child: Shimmer.fromColors(
                      child: Container(
                        height: 196,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                      baseColor: Colors.grey[200],
                      highlightColor: Colors.grey[350],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 90,
                    width: MediaQuery.of(context).size.width,
                    child: Shimmer.fromColors(
                      child: Container(
                        height: 196,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                      baseColor: Colors.grey[200],
                      highlightColor: Colors.grey[350],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 90,
                    width: MediaQuery.of(context).size.width,
                    child: Shimmer.fromColors(
                      child: Container(
                        height: 196,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                      baseColor: Colors.grey[200],
                      highlightColor: Colors.grey[350],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 90,
                    width: MediaQuery.of(context).size.width,
                    child: Shimmer.fromColors(
                      child: Container(
                        height: 196,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                      baseColor: Colors.grey[200],
                      highlightColor: Colors.grey[350],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 90,
                    width: MediaQuery.of(context).size.width,
                    child: Shimmer.fromColors(
                      child: Container(
                        height: 196,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                      baseColor: Colors.grey[200],
                      highlightColor: Colors.grey[350],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 90,
                    width: MediaQuery.of(context).size.width,
                    child: Shimmer.fromColors(
                      child: Container(
                        height: 196,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                      baseColor: Colors.grey[200],
                      highlightColor: Colors.grey[350],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 90,
                    width: MediaQuery.of(context).size.width,
                    child: Shimmer.fromColors(
                      child: Container(
                        height: 196,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                      baseColor: Colors.grey[200],
                      highlightColor: Colors.grey[350],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 90,
                    width: MediaQuery.of(context).size.width,
                    child: Shimmer.fromColors(
                      child: Container(
                        height: 196,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
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
    );
  }
}
