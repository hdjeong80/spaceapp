import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spaceapp/datafile.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../color.dart';
import 'Itemlist.dart';

class Default extends StatefulWidget {
  @override
  _DefaultState createState() => _DefaultState();
}

bool toggle = false;
int selectedplanet = 1;

int index;

class _DefaultState extends State<Default> {
  TextEditingController _abputmeController = TextEditingController();
  bool addbutton = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  language ? '내 우주 🌏' : 'My universe 🌏',
                  style: TextStyle(
                      fontFamily: font1,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 23),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: 54.91,
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: TextField(
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: containercolor),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          size: 25,
                          color: textcolor2,
                        ),
                        contentPadding: EdgeInsets.zero,
                        hintStyle: new TextStyle(
                            color: textcolor, fontFamily: font1, fontSize: 15),
                        hintText: language
                            ? '창고 이름을 검색하세요.'
                            : 'Search for the warehouse name.',
                        fillColor: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                StreamBuilder(
                    stream: instans
                        .collection('Planets')
                        .where('userid', isEqualTo: userFirebaseID)
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      //print("length :: "+snapshot.data.docs.length.toString());

                      if (snapshot.hasData)
                        return Column(
                          children: [
                            for (int i = 0;
                                i <= snapshot.data.docs.length;
                                i += 2)
                              Column(
                                children: [
                                  snapshot.data.docs.length % 2 != 0
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              width: 154,
                                              decoration: BoxDecoration(
                                                color: bgcolor2,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20, top: 10),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        InkWell(
                                                          child: Image.asset(
                                                            'assets/planets/' +
                                                                snapshot
                                                                    .data
                                                                    .docs[i][
                                                                        'selected']
                                                                    .toString() +
                                                                '.png',
                                                            height: 44,
                                                            width: 44,
                                                          ),
                                                          onTap: () async {
                                                            /* Navigator.pushNamed(
                                                                context,
                                                                "Itemlist");*/
                                                            List retrievedData;
                                                            List retrievedData1;
                                                            List<String> urls =
                                                                [];
                                                            List<String> urls1 =
                                                                [];
                                                            var collectionReferece = await instans
                                                                .collection(
                                                                    'Products')
                                                                .where(
                                                                    'categoryID',
                                                                    isEqualTo:
                                                                        snapshot
                                                                            .data
                                                                            .docs[i]
                                                                            .id);
                                                            collectionReferece
                                                                .get()
                                                                .then(
                                                                    (collectionSnapshot) async {
                                                              retrievedData =
                                                                  collectionSnapshot
                                                                      .docs
                                                                      .toList();
                                                              // ids= collectionSnapshot.docs.toList();
                                                              print(
                                                                  retrievedData
                                                                      .length);
                                                              for (int x = 0;
                                                                  x <
                                                                      retrievedData
                                                                          .length;
                                                                  x++) {
                                                                var collectionRefereces = await instans
                                                                    .collection(
                                                                        'ProductImages')
                                                                    .where(
                                                                        'ProductID',
                                                                        isEqualTo: collectionSnapshot
                                                                            .docs[x]
                                                                            .id);

                                                                collectionRefereces
                                                                    .get()
                                                                    .then(
                                                                        (collectionSnapshots) {
                                                                  retrievedData1 =
                                                                      collectionSnapshots
                                                                          .docs
                                                                          .toList();
                                                                  //urls.add(retrievedData1[0]['URL'].toString());

                                                                  urls.add(
                                                                      retrievedData1[
                                                                              0]
                                                                          [
                                                                          'URL']);
                                                                  if (retrievedData[
                                                                              x]
                                                                          [
                                                                          'transaction'] ==
                                                                      true) {
                                                                    urls1.add(
                                                                        retrievedData1[0]
                                                                            [
                                                                            'URL']);
                                                                  }
                                                                  print(retrievedData1[
                                                                          0]
                                                                      ['URL']);
                                                                  if (x + 1 ==
                                                                      retrievedData
                                                                          .length) {
                                                                    Navigator
                                                                        .push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) => Itemlist(
                                                                              snapshot.data.docs[i].id,
                                                                              snapshot.data.docs[i]['planetname'],
                                                                              snapshot.data.docs[i]['private'],
                                                                              snapshot.data.docs[i]['selected'],
                                                                              urls,
                                                                              urls1)),
                                                                    );
                                                                  }
                                                                });
                                                              }
                                                              if (retrievedData
                                                                      .length ==
                                                                  0) {
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (context) => Itemlist(
                                                                          snapshot
                                                                              .data
                                                                              .docs[
                                                                                  i]
                                                                              .id,
                                                                          snapshot.data.docs[i]
                                                                              [
                                                                              'planetname'],
                                                                          snapshot.data.docs[i]
                                                                              [
                                                                              'private'],
                                                                          snapshot
                                                                              .data
                                                                              .docs[i]['selected'],
                                                                          urls,
                                                                          urls1)),
                                                                );
                                                              }
                                                            });

                                                            print(snapshot.data
                                                                .docs[i].id);
                                                            /* Navigator.push(
                                                              context,
                                                              MaterialPageRoute(builder: (context) => Itemlist(snapshot.data.docs[i].id,snapshot.data.docs[i]['planetname']
                                                                  ,snapshot.data.docs[i]['private'],snapshot.data.docs[i]['selected'],urls)),
                                                            );*/
                                                          },
                                                        ),
                                                        Spacer(),
                                                        IconButton(
                                                          icon: Icon(
                                                              Icons.delete),
                                                          color: Colors.red,
                                                          onPressed: () {
                                                            showDialog(
                                                                context:
                                                                    context,
                                                                builder: (BuildContext
                                                                        context) =>
                                                                    CupertinoAlertDialog(
                                                                      title: new Text(language
                                                                          ? "삭제"
                                                                          : "Delete"),
                                                                      content: new Text(language
                                                                          ? "정말 삭제하시겠습니까?"
                                                                          : "Are you sure you want to delete this planet"),
                                                                      actions: <
                                                                          Widget>[
                                                                        CupertinoDialogAction(
                                                                          isDefaultAction:
                                                                              true,
                                                                          child: Text(language
                                                                              ? "확인"
                                                                              : "Yes"),
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.pop(context);
                                                                          },
                                                                        ),
                                                                        CupertinoDialogAction(
                                                                          child: Text(language
                                                                              ? "취소"
                                                                              : "No"),
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.pop(context);
                                                                          },
                                                                        )
                                                                      ],
                                                                    ));
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    RichText(
                                                      text: TextSpan(
                                                        text: snapshot
                                                            .data
                                                            .docs[i]
                                                                ['planetname']
                                                            .toString(),
                                                        style: TextStyle(
                                                            color: textcolor3,
                                                            fontSize: 15,
                                                            fontFamily: font1,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                              text: language
                                                                  ? ' 행성'
                                                                  : ' planet ',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      font1,
                                                                  fontSize: 16,
                                                                  color:
                                                                      textcolor3,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w100)),
                                                        ],
                                                      ),
                                                    ),
                                                    StreamBuilder(
                                                        stream: instans
                                                            .collection(
                                                                'Products')
                                                            .where('categoryID',
                                                                isEqualTo:
                                                                    snapshot
                                                                        .data
                                                                        .docs[i]
                                                                        .id)
                                                            .snapshots(),
                                                        builder: (BuildContext
                                                                context,
                                                            AsyncSnapshot<
                                                                    QuerySnapshot>
                                                                thingssnapshot) {
                                                          if (thingssnapshot
                                                                  .data !=
                                                              null) if (thingssnapshot.hasData)
                                                            return Text(
                                                              thingssnapshot
                                                                      .data
                                                                      .docs
                                                                      .length
                                                                      .toString() +
                                                                  " things",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      font1,
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 15),
                                                            );
                                                          else
                                                            return Container();
                                                          else
                                                            return Container();
                                                        }),
                                                    SizedBox(
                                                      height: 15,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            i != (snapshot.data.docs.length - 1)
                                                ? Container(
                                                    width: 154,
                                                    decoration: BoxDecoration(
                                                      color: bgcolor2,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20,
                                                              top: 10),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              InkWell(
                                                                child:
                                                                    Image.asset(
                                                                  'assets/planets/' +
                                                                      snapshot
                                                                          .data
                                                                          .docs[
                                                                              i + 1]
                                                                              [
                                                                              'selected']
                                                                          .toString() +
                                                                      '.png',
                                                                  height: 44,
                                                                  width: 44,
                                                                ),
                                                                onTap:
                                                                    () async {
                                                                  List
                                                                      retrievedData;
                                                                  List
                                                                      retrievedData1;
                                                                  List<String>
                                                                      urls = [];
                                                                  List<String>
                                                                      urls1 =
                                                                      [];
                                                                  var collectionReferece = await instans
                                                                      .collection(
                                                                          'Products')
                                                                      .where(
                                                                          'categoryID',
                                                                          isEqualTo: snapshot
                                                                              .data
                                                                              .docs[i + 1]
                                                                              .id);
                                                                  collectionReferece
                                                                      .get()
                                                                      .then(
                                                                          (collectionSnapshot) async {
                                                                    retrievedData =
                                                                        collectionSnapshot
                                                                            .docs
                                                                            .toList();
                                                                    // ids= collectionSnapshot.docs.toList();
                                                                    print(retrievedData
                                                                        .length);
                                                                    for (int x =
                                                                            0;
                                                                        x < retrievedData.length;
                                                                        x++) {
                                                                      var collectionRefereces = await instans
                                                                          .collection(
                                                                              'ProductImages')
                                                                          .where(
                                                                              'ProductID',
                                                                              isEqualTo: collectionSnapshot.docs[x].id);

                                                                      collectionRefereces
                                                                          .get()
                                                                          .then(
                                                                              (collectionSnapshots) {
                                                                        retrievedData1 = collectionSnapshots
                                                                            .docs
                                                                            .toList();
                                                                        //urls.add(retrievedData1[0]['URL'].toString());

                                                                        urls.add(retrievedData1[0]
                                                                            [
                                                                            'URL']);
                                                                        if (retrievedData[x]['transaction'] ==
                                                                            true) {
                                                                          urls1.add(retrievedData1[0]
                                                                              [
                                                                              'URL']);
                                                                        }
                                                                        print(retrievedData1[0]
                                                                            [
                                                                            'URL']);
                                                                        if (x + 1 ==
                                                                            retrievedData.length) {
                                                                          Navigator
                                                                              .push(
                                                                            context,
                                                                            MaterialPageRoute(builder: (context) => Itemlist(snapshot.data.docs[i + 1].id, snapshot.data.docs[i + 1]['planetname'], snapshot.data.docs[i + 1]['private'], snapshot.data.docs[i + 1]['selected'], urls, urls1)),
                                                                          );
                                                                        }
                                                                      });
                                                                    }
                                                                    if (retrievedData
                                                                            .length ==
                                                                        0) {
                                                                      Navigator
                                                                          .push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                            builder: (context) => Itemlist(
                                                                                snapshot.data.docs[i + 1].id,
                                                                                snapshot.data.docs[i + 1]['planetname'],
                                                                                snapshot.data.docs[i + 1]['private'],
                                                                                snapshot.data.docs[i + 1]['selected'],
                                                                                urls,
                                                                                urls1)),
                                                                      );
                                                                    }
                                                                  });
                                                                },
                                                              ),
                                                              Spacer(),
                                                              IconButton(
                                                                icon: Icon(Icons
                                                                    .delete),
                                                                color:
                                                                    Colors.red,
                                                                onPressed: () {
                                                                  showDialog(
                                                                      context:
                                                                          context,
                                                                      builder: (BuildContext
                                                                              context) =>
                                                                          CupertinoAlertDialog(
                                                                            title: new Text(language
                                                                                ? "삭제"
                                                                                : "Delete"),
                                                                            content: new Text(language
                                                                                ? "정말 삭제하시겠습니까?"
                                                                                : "Are you sure you want to delete this planet"),
                                                                            actions: <Widget>[
                                                                              CupertinoDialogAction(
                                                                                isDefaultAction: true,
                                                                                child: Text(language ? "확인" : "Yes"),
                                                                                onPressed: () {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                              ),
                                                                              CupertinoDialogAction(
                                                                                child: Text(language ? "취소" : "No"),
                                                                                onPressed: () {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                              )
                                                                            ],
                                                                          ));
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          RichText(
                                                            text: TextSpan(
                                                              text: snapshot
                                                                  .data
                                                                  .docs[i + 1][
                                                                      'planetname']
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  color:
                                                                      textcolor3,
                                                                  fontSize: 15,
                                                                  fontFamily:
                                                                      font1,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                              children: <
                                                                  TextSpan>[
                                                                TextSpan(
                                                                    text: language
                                                                        ? ' 행성'
                                                                        : ' planet ',
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            font1,
                                                                        fontSize:
                                                                            16,
                                                                        color:
                                                                            textcolor3,
                                                                        fontWeight:
                                                                            FontWeight.w100)),
                                                              ],
                                                            ),
                                                          ),
                                                          StreamBuilder(
                                                              stream: instans
                                                                  .collection(
                                                                      'Products')
                                                                  .where(
                                                                      'categoryID',
                                                                      isEqualTo: snapshot
                                                                          .data
                                                                          .docs[
                                                                              i]
                                                                          .id)
                                                                  .snapshots(),
                                                              builder: (BuildContext
                                                                      context,
                                                                  AsyncSnapshot<
                                                                          QuerySnapshot>
                                                                      thingssnapshot) {
                                                                if (thingssnapshot
                                                                        .data !=
                                                                    null) if (thingssnapshot.hasData)
                                                                  return Text(
                                                                    thingssnapshot
                                                                            .data
                                                                            .docs
                                                                            .length
                                                                            .toString() +
                                                                        " things",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            font1,
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            15),
                                                                  );
                                                                else
                                                                  return Container();
                                                                else
                                                                  return Container();
                                                              }),
                                                          SizedBox(
                                                            height: 15,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                : DottedBorder(
                                                    borderType:
                                                        BorderType.RRect,
                                                    radius: Radius.circular(20),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20)),
                                                      child: InkWell(
                                                        onTap: () {
                                                          showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return Container(
                                                                  child:
                                                                      StatefulBuilder(
                                                                    builder: (BuildContext
                                                                            context,
                                                                        StateSetter
                                                                            stateSetter) {
                                                                      return Container(
                                                                        // height: 300,
                                                                        decoration: BoxDecoration(
                                                                            color: Colors.white,
                                                                            borderRadius: BorderRadius.only(
                                                                              topLeft: Radius.circular(30),
                                                                              topRight: Radius.circular(30),
                                                                            )),
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 20, top: 20),
                                                                              child: Text(
                                                                                language ? '행성 추가' : 'Add planet',
                                                                                style: TextStyle(fontWeight: FontWeight.bold, fontFamily: font1, fontSize: 19, color: textcolor3),
                                                                              ),
                                                                            ),
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                              children: [
                                                                                Stack(
                                                                                  children: [
                                                                                    InkWell(
                                                                                      child: Image.asset(
                                                                                        'assets/planets/1.png',
                                                                                        height: 50,
                                                                                        width: 50,
                                                                                      ),
                                                                                      onTap: () {
                                                                                        stateSetter(() {
                                                                                          selectedplanet = 1;
                                                                                          print(selectedplanet.toString());
                                                                                        });
                                                                                      },
                                                                                    ),
                                                                                    Positioned(
                                                                                      left: 25,
                                                                                      top: 25,
                                                                                      child: selectedplanet == 1
                                                                                          ? Image.asset(
                                                                                              'assets/checkcircle.png',
                                                                                              height: 25,
                                                                                              width: 25.75,
                                                                                            )
                                                                                          : Container(),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Stack(
                                                                                  children: [
                                                                                    InkWell(
                                                                                      child: Image.asset(
                                                                                        'assets/planets/2.png',
                                                                                        height: 50,
                                                                                        width: 50,
                                                                                      ),
                                                                                      onTap: () {
                                                                                        stateSetter(() {
                                                                                          selectedplanet = 2;
                                                                                          print(selectedplanet.toString());
                                                                                        });
                                                                                      },
                                                                                    ),
                                                                                    Positioned(
                                                                                      left: 25,
                                                                                      top: 25,
                                                                                      child: selectedplanet == 2
                                                                                          ? Image.asset(
                                                                                              'assets/checkcircle.png',
                                                                                              height: 25.75,
                                                                                              width: 25.75,
                                                                                            )
                                                                                          : Container(),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Stack(
                                                                                  children: [
                                                                                    InkWell(
                                                                                      child: Image.asset(
                                                                                        'assets/planets/3.png',
                                                                                        height: 50,
                                                                                        width: 50,
                                                                                      ),
                                                                                      onTap: () {
                                                                                        stateSetter(() {
                                                                                          selectedplanet = 3;
                                                                                          print(selectedplanet.toString());
                                                                                        });
                                                                                      },
                                                                                    ),
                                                                                    Positioned(
                                                                                      left: 25,
                                                                                      top: 25,
                                                                                      child: selectedplanet == 3
                                                                                          ? Image.asset(
                                                                                              'assets/checkcircle.png',
                                                                                              height: 25.75,
                                                                                              width: 25.75,
                                                                                            )
                                                                                          : Container(),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Stack(
                                                                                  children: [
                                                                                    InkWell(
                                                                                      child: Image.asset(
                                                                                        'assets/planets/4.png',
                                                                                        height: 50,
                                                                                        width: 50,
                                                                                      ),
                                                                                      onTap: () {
                                                                                        stateSetter(() {
                                                                                          selectedplanet = 4;
                                                                                          print(selectedplanet.toString());
                                                                                        });
                                                                                      },
                                                                                    ),
                                                                                    Positioned(
                                                                                      left: 25,
                                                                                      top: 25,
                                                                                      child: selectedplanet == 4
                                                                                          ? Image.asset(
                                                                                              'assets/checkcircle.png',
                                                                                              height: 25.75,
                                                                                              width: 25.75,
                                                                                            )
                                                                                          : Container(),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            SizedBox(
                                                                              height: 15,
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 40, right: 40),
                                                                              child: TextFormField(
                                                                                decoration: InputDecoration(
                                                                                  enabledBorder: UnderlineInputBorder(
                                                                                    borderSide: BorderSide(color: textcolor),
                                                                                  ),
                                                                                  focusedBorder: UnderlineInputBorder(
                                                                                    borderSide: BorderSide(color: containercolor),
                                                                                  ),
                                                                                  hintText: language ? '행성 이름' : "Planet name",
                                                                                  hintStyle: TextStyle(color: textcolor, fontSize: 16, fontFamily: font1),
                                                                                  suffixText: language ? '행성' : "planet",
                                                                                  suffixStyle: TextStyle(color: containercolor, fontSize: 15, fontFamily: font1),
                                                                                ),
                                                                                controller: _abputmeController,
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 20, right: 20),
                                                                              child: Row(
                                                                                children: [
                                                                                  Text(
                                                                                    language ? '비공개 설정' : 'Private setting',
                                                                                    style: TextStyle(fontFamily: font1, fontSize: 16, color: Colors.black),
                                                                                  ),
                                                                                  Spacer(),
                                                                                  Transform.scale(
                                                                                    scale: 0.8,
                                                                                    child: CupertinoSwitch(
                                                                                      activeColor: containercolor,
                                                                                      value: toggle,
                                                                                      onChanged: (val) {
                                                                                        stateSetter(() => toggle = val);
                                                                                      },
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 20,
                                                                            ),
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                              children: [
                                                                                Container(
                                                                                  height: 50,
                                                                                  width: MediaQuery.of(context).size.width / 2.5,
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(50),
                                                                                    child: RaisedButton(
                                                                                      child: Text(
                                                                                        language ? '취소' : 'cancel',
                                                                                        style: TextStyle(color: modalbutton, fontSize: 16, fontFamily: font1),
                                                                                      ),
                                                                                      onPressed: () {},
                                                                                      color: modal,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  height: 50,
                                                                                  width: MediaQuery.of(context).size.width / 2.5,
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(50),
                                                                                    child: RaisedButton(
                                                                                      child: InkWell(
                                                                                        child: Text(
                                                                                          language ? '추가' : 'Add',
                                                                                          style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: font1),
                                                                                        ),
                                                                                      ),
                                                                                      onPressed: addbutton
                                                                                          ? null
                                                                                          : () async {
                                                                                              print(selectedplanet);
                                                                                              print(_abputmeController.text);
                                                                                              print(toggle);
                                                                                              stateSetter(() {
                                                                                                addbutton = true;
                                                                                              });
                                                                                              instans.collection('Planets').where('userid', isEqualTo: userFirebaseID).where('planetname', isEqualTo: _abputmeController.text).get().then((QuerySnapshot querydata) async {
                                                                                                if (querydata.docs.isNotEmpty) {
                                                                                                  stateSetter(() {
                                                                                                    addbutton = false;
                                                                                                  });
                                                                                                  Navigator.pop(context);
                                                                                                  showSnackbar("Sorry! you already have the same name Planet");
                                                                                                } else {
                                                                                                  await instans.collection("Planets").add({
                                                                                                    'planetname': _abputmeController.text,
                                                                                                    'selected': selectedplanet.toString(),
                                                                                                    'private': toggle,
                                                                                                    'userid': userFirebaseID,
                                                                                                    'items': 0,
                                                                                                    'datetime': DateTime.now()
                                                                                                  }).then((value) {
                                                                                                    listItem2.add(_abputmeController.text);
                                                                                                    listItem2Ids.add(value.id);

                                                                                                    stateSetter(() {
                                                                                                      addbutton = false;
                                                                                                    });
                                                                                                    Navigator.pop(context);
                                                                                                    showSnackbar("New Planet has been Added");
                                                                                                  });
                                                                                                }
                                                                                              });

                                                                                              // Navigator.pop(context);
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
                                                                      );
                                                                    },
                                                                  ),
                                                                );
                                                              });
                                                        },
                                                        child: Container(
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Image.asset(
                                                                'assets/doted.png',
                                                                height: 44.93,
                                                                width: 44.93,
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                language
                                                                    ? '행성 추가'
                                                                    : 'Add planet',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        16,
                                                                    color:
                                                                        textcolor),
                                                              )
                                                            ],
                                                          ),
                                                          height: 127,
                                                          width: 154,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                          ],
                                        )
                                      :
                                      //  i!= (snapshot.data.docs.length-1)?

                                      i != (snapshot.data.docs.length)
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  width: 154,
                                                  decoration: BoxDecoration(
                                                    color: bgcolor2,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 20, top: 10),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            InkWell(
                                                              child:
                                                                  Image.asset(
                                                                'assets/planets/' +
                                                                    snapshot
                                                                        .data
                                                                        .docs[i]
                                                                            [
                                                                            'selected']
                                                                        .toString() +
                                                                    '.png',
                                                                height: 44,
                                                                width: 44,
                                                              ),
                                                              onTap: () async {
                                                                List
                                                                    retrievedData;
                                                                List
                                                                    retrievedData1;
                                                                List<String>
                                                                    urls = [];
                                                                List<String>
                                                                    urls1 = [];
                                                                var collectionReferece = await instans
                                                                    .collection(
                                                                        'Products')
                                                                    .where(
                                                                        'categoryID',
                                                                        isEqualTo: snapshot
                                                                            .data
                                                                            .docs[i]
                                                                            .id);
                                                                collectionReferece
                                                                    .get()
                                                                    .then(
                                                                        (collectionSnapshot) async {
                                                                  retrievedData =
                                                                      collectionSnapshot
                                                                          .docs
                                                                          .toList();
                                                                  // ids= collectionSnapshot.docs.toList();
                                                                  print(retrievedData
                                                                      .length);
                                                                  for (int x =
                                                                          0;
                                                                      x <
                                                                          retrievedData
                                                                              .length;
                                                                      x++) {
                                                                    var collectionRefereces = await instans
                                                                        .collection(
                                                                            'ProductImages')
                                                                        .where(
                                                                            'ProductID',
                                                                            isEqualTo:
                                                                                collectionSnapshot.docs[x].id);

                                                                    collectionRefereces
                                                                        .get()
                                                                        .then(
                                                                            (collectionSnapshots) {
                                                                      retrievedData1 = collectionSnapshots
                                                                          .docs
                                                                          .toList();
                                                                      //urls.add(retrievedData1[0]['URL'].toString());

                                                                      urls.add(retrievedData1[
                                                                              0]
                                                                          [
                                                                          'URL']);
                                                                      if (retrievedData[x]
                                                                              [
                                                                              'transaction'] ==
                                                                          true) {
                                                                        urls1.add(retrievedData1[0]
                                                                            [
                                                                            'URL']);
                                                                      }
                                                                      print(retrievedData1[
                                                                              0]
                                                                          [
                                                                          'URL']);
                                                                      if (x + 1 ==
                                                                          retrievedData
                                                                              .length) {
                                                                        Navigator
                                                                            .push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                              builder: (context) => Itemlist(snapshot.data.docs[i].id, snapshot.data.docs[i]['planetname'], snapshot.data.docs[i]['private'], snapshot.data.docs[i]['selected'], urls, urls1)),
                                                                        );
                                                                      }
                                                                    });
                                                                  }
                                                                  if (retrievedData
                                                                          .length ==
                                                                      0) {
                                                                    Navigator
                                                                        .push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) => Itemlist(
                                                                              snapshot.data.docs[i].id,
                                                                              snapshot.data.docs[i]['planetname'],
                                                                              snapshot.data.docs[i]['private'],
                                                                              snapshot.data.docs[i]['selected'],
                                                                              urls,
                                                                              urls1)),
                                                                    );
                                                                  }
                                                                });
                                                              },
                                                            ),
                                                            Spacer(),
                                                            IconButton(
                                                              icon: Icon(
                                                                  Icons.delete),
                                                              color: Colors.red,
                                                              onPressed: () {
                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder: (BuildContext
                                                                            context) =>
                                                                        CupertinoAlertDialog(
                                                                          title: new Text(language
                                                                              ? "삭제"
                                                                              : "Delete"),
                                                                          content: new Text(language
                                                                              ? "정말 삭제하시겠습니까?"
                                                                              : "Are you sure you want to delete this planet"),
                                                                          actions: <
                                                                              Widget>[
                                                                            CupertinoDialogAction(
                                                                              isDefaultAction: true,
                                                                              child: Text(language ? "확인" : "Yes"),
                                                                              onPressed: () {
                                                                                Navigator.pop(context);
                                                                              },
                                                                            ),
                                                                            CupertinoDialogAction(
                                                                              child: Text(language ? "취소" : "No"),
                                                                              onPressed: () {
                                                                                Navigator.pop(context);
                                                                              },
                                                                            )
                                                                          ],
                                                                        ));
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        RichText(
                                                          text: TextSpan(
                                                            text: snapshot
                                                                .data
                                                                .docs[i][
                                                                    'planetname']
                                                                .toString(),
                                                            style: TextStyle(
                                                                color:
                                                                    textcolor3,
                                                                fontSize: 15,
                                                                fontFamily:
                                                                    font1,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                            children: <
                                                                TextSpan>[
                                                              TextSpan(
                                                                  text: language
                                                                      ? ' 행성'
                                                                      : ' planet ',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          font1,
                                                                      fontSize:
                                                                          16,
                                                                      color:
                                                                          textcolor3,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100)),
                                                            ],
                                                          ),
                                                        ),
                                                        StreamBuilder(
                                                            stream: instans
                                                                .collection(
                                                                    'Products')
                                                                .where(
                                                                    'categoryID',
                                                                    isEqualTo:
                                                                        snapshot
                                                                            .data
                                                                            .docs[
                                                                                i]
                                                                            .id)
                                                                .snapshots(),
                                                            builder: (BuildContext
                                                                    context,
                                                                AsyncSnapshot<
                                                                        QuerySnapshot>
                                                                    thingssnapshot) {
                                                              if (thingssnapshot
                                                                      .data !=
                                                                  null) if (thingssnapshot.hasData)
                                                                return Text(
                                                                  thingssnapshot
                                                                          .data
                                                                          .docs
                                                                          .length
                                                                          .toString() +
                                                                      " things",
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          font1,
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          15),
                                                                );
                                                              else
                                                                return Container();
                                                              else
                                                                return Container();
                                                            }),
                                                        SizedBox(
                                                          height: 15,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 154,
                                                  decoration: BoxDecoration(
                                                    color: bgcolor2,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 20, top: 10),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            InkWell(
                                                              child:
                                                                  Image.asset(
                                                                'assets/planets/' +
                                                                    snapshot
                                                                        .data
                                                                        .docs[
                                                                            i + 1]
                                                                            [
                                                                            'selected']
                                                                        .toString() +
                                                                    '.png',
                                                                height: 44,
                                                                width: 44,
                                                              ),
                                                              onTap: () async {
                                                                List
                                                                    retrievedData;
                                                                List
                                                                    retrievedData1;
                                                                List<String>
                                                                    urls = [];
                                                                List<String>
                                                                    urls1 = [];
                                                                var collectionReferece = await instans
                                                                    .collection(
                                                                        'Products')
                                                                    .where(
                                                                        'categoryID',
                                                                        isEqualTo: snapshot
                                                                            .data
                                                                            .docs[i +
                                                                                1]
                                                                            .id);
                                                                collectionReferece
                                                                    .get()
                                                                    .then(
                                                                        (collectionSnapshot) async {
                                                                  retrievedData =
                                                                      collectionSnapshot
                                                                          .docs
                                                                          .toList();
                                                                  // ids= collectionSnapshot.docs.toList();
                                                                  print(retrievedData
                                                                      .length);
                                                                  for (int x =
                                                                          0;
                                                                      x <
                                                                          retrievedData
                                                                              .length;
                                                                      x++) {
                                                                    var collectionRefereces = await instans
                                                                        .collection(
                                                                            'ProductImages')
                                                                        .where(
                                                                            'ProductID',
                                                                            isEqualTo:
                                                                                collectionSnapshot.docs[x].id);

                                                                    collectionRefereces
                                                                        .get()
                                                                        .then(
                                                                            (collectionSnapshots) {
                                                                      retrievedData1 = collectionSnapshots
                                                                          .docs
                                                                          .toList();
                                                                      //urls.add(retrievedData1[0]['URL'].toString());

                                                                      urls.add(retrievedData1[
                                                                              0]
                                                                          [
                                                                          'URL']);
                                                                      if (retrievedData[x]
                                                                              [
                                                                              'transaction'] ==
                                                                          true) {
                                                                        urls1.add(retrievedData1[0]
                                                                            [
                                                                            'URL']);
                                                                      }
                                                                      print(retrievedData1[
                                                                              0]
                                                                          [
                                                                          'URL']);
                                                                      if (x + 1 ==
                                                                          retrievedData
                                                                              .length) {
                                                                        Navigator
                                                                            .push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                              builder: (context) => Itemlist(snapshot.data.docs[i + 1].id, snapshot.data.docs[i + 1]['planetname'], snapshot.data.docs[i + 1]['private'], snapshot.data.docs[i + 1]['selected'], urls, urls1)),
                                                                        );
                                                                      }
                                                                    });
                                                                  }
                                                                  if (retrievedData
                                                                          .length ==
                                                                      0) {
                                                                    Navigator
                                                                        .push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) => Itemlist(
                                                                              snapshot.data.docs[i + 1].id,
                                                                              snapshot.data.docs[i + 1]['planetname'],
                                                                              snapshot.data.docs[i + 1]['private'],
                                                                              snapshot.data.docs[i + 1]['selected'],
                                                                              urls,
                                                                              urls1)),
                                                                    );
                                                                  }
                                                                });
                                                              },
                                                            ),
                                                            Spacer(),
                                                            IconButton(
                                                              icon: Icon(
                                                                  Icons.delete),
                                                              color: Colors.red,
                                                              onPressed: () {
                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder: (BuildContext
                                                                            context) =>
                                                                        CupertinoAlertDialog(
                                                                          title: new Text(language
                                                                              ? "삭제"
                                                                              : "Delete"),
                                                                          content: new Text(language
                                                                              ? "정말 삭제하시겠습니까?"
                                                                              : "Are you sure you want to delete this planet"),
                                                                          actions: <
                                                                              Widget>[
                                                                            CupertinoDialogAction(
                                                                              isDefaultAction: true,
                                                                              child: Text(language ? "확인" : "Yes"),
                                                                              onPressed: () {
                                                                                Navigator.pop(context);
                                                                              },
                                                                            ),
                                                                            CupertinoDialogAction(
                                                                              child: Text(language ? "취소" : "No"),
                                                                              onPressed: () {
                                                                                Navigator.pop(context);
                                                                              },
                                                                            )
                                                                          ],
                                                                        ));
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        RichText(
                                                          text: TextSpan(
                                                            text: snapshot
                                                                .data
                                                                .docs[i + 1][
                                                                    'planetname']
                                                                .toString(),
                                                            style: TextStyle(
                                                                color:
                                                                    textcolor3,
                                                                fontSize: 15,
                                                                fontFamily:
                                                                    font1,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                            children: <
                                                                TextSpan>[
                                                              TextSpan(
                                                                  text: language
                                                                      ? ' 행성'
                                                                      : ' planet ',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          font1,
                                                                      fontSize:
                                                                          16,
                                                                      color:
                                                                          textcolor3,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100)),
                                                            ],
                                                          ),
                                                        ),
                                                        StreamBuilder(
                                                            stream: instans
                                                                .collection(
                                                                    'Products')
                                                                .where(
                                                                    'categoryID',
                                                                    isEqualTo:
                                                                        snapshot
                                                                            .data
                                                                            .docs[
                                                                                i]
                                                                            .id)
                                                                .snapshots(),
                                                            builder: (BuildContext
                                                                    context,
                                                                AsyncSnapshot<
                                                                        QuerySnapshot>
                                                                    thingssnapshot) {
                                                              if (thingssnapshot
                                                                      .data !=
                                                                  null) if (thingssnapshot.hasData)
                                                                return Text(
                                                                  thingssnapshot
                                                                          .data
                                                                          .docs
                                                                          .length
                                                                          .toString() +
                                                                      " things",
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          font1,
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          15),
                                                                );
                                                              else
                                                                return Container();
                                                              else
                                                                return Container();
                                                            }),
                                                        SizedBox(
                                                          height: 15,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                          : Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  DottedBorder(
                                                    borderType:
                                                        BorderType.RRect,
                                                    radius: Radius.circular(20),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20)),
                                                      child: InkWell(
                                                        onTap: () {
                                                          showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return Container(
                                                                  child:
                                                                      StatefulBuilder(
                                                                    builder: (BuildContext
                                                                            context,
                                                                        StateSetter
                                                                            stateSetter) {
                                                                      return Container(
                                                                        // height: 300,
                                                                        decoration: BoxDecoration(
                                                                            color: Colors.white,
                                                                            borderRadius: BorderRadius.only(
                                                                              topLeft: Radius.circular(30),
                                                                              topRight: Radius.circular(30),
                                                                            )),
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 20, top: 20),
                                                                              child: Text(
                                                                                language ? '행성 추가' : 'Add planet',
                                                                                style: TextStyle(fontWeight: FontWeight.bold, fontFamily: font1, fontSize: 19, color: textcolor3),
                                                                              ),
                                                                            ),
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                              children: [
                                                                                Stack(
                                                                                  children: [
                                                                                    InkWell(
                                                                                      child: Image.asset(
                                                                                        'assets/planets/1.png',
                                                                                        height: 50,
                                                                                        width: 50,
                                                                                      ),
                                                                                      onTap: () {
                                                                                        stateSetter(() {
                                                                                          selectedplanet = 1;
                                                                                          print(selectedplanet.toString());
                                                                                        });
                                                                                      },
                                                                                    ),
                                                                                    Positioned(
                                                                                      left: 25,
                                                                                      top: 25,
                                                                                      child: selectedplanet == 1
                                                                                          ? Image.asset(
                                                                                              'assets/checkcircle.png',
                                                                                              height: 25.75,
                                                                                              width: 25.75,
                                                                                            )
                                                                                          : Container(),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Stack(
                                                                                  children: [
                                                                                    InkWell(
                                                                                      child: Image.asset(
                                                                                        'assets/planets/2.png',
                                                                                        height: 50,
                                                                                        width: 50,
                                                                                      ),
                                                                                      onTap: () {
                                                                                        stateSetter(() {
                                                                                          selectedplanet = 2;
                                                                                          print(selectedplanet.toString());
                                                                                        });
                                                                                      },
                                                                                    ),
                                                                                    Positioned(
                                                                                      left: 25,
                                                                                      top: 25,
                                                                                      child: selectedplanet == 2
                                                                                          ? Image.asset(
                                                                                              'assets/checkcircle.png',
                                                                                              height: 25.75,
                                                                                              width: 25.75,
                                                                                            )
                                                                                          : Container(),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Stack(
                                                                                  children: [
                                                                                    InkWell(
                                                                                      child: Image.asset(
                                                                                        'assets/planets/3.png',
                                                                                        height: 50,
                                                                                        width: 50,
                                                                                      ),
                                                                                      onTap: () {
                                                                                        stateSetter(() {
                                                                                          selectedplanet = 3;
                                                                                          print(selectedplanet.toString());
                                                                                        });
                                                                                      },
                                                                                    ),
                                                                                    Positioned(
                                                                                      left: 25,
                                                                                      top: 25,
                                                                                      child: selectedplanet == 3
                                                                                          ? Image.asset(
                                                                                              'assets/checkcircle.png',
                                                                                              height: 25.75,
                                                                                              width: 25.75,
                                                                                            )
                                                                                          : Container(),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Stack(
                                                                                  children: [
                                                                                    InkWell(
                                                                                      child: Image.asset(
                                                                                        'assets/planets/4.png',
                                                                                        height: 50,
                                                                                        width: 50,
                                                                                      ),
                                                                                      onTap: () {
                                                                                        stateSetter(() {
                                                                                          selectedplanet = 4;
                                                                                          print(selectedplanet.toString());
                                                                                        });
                                                                                      },
                                                                                    ),
                                                                                    Positioned(
                                                                                      left: 25,
                                                                                      top: 25,
                                                                                      child: selectedplanet == 4
                                                                                          ? Image.asset(
                                                                                              'assets/checkcircle.png',
                                                                                              height: 25.75,
                                                                                              width: 25.75,
                                                                                            )
                                                                                          : Container(),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            SizedBox(
                                                                              height: 15,
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 40, right: 40),
                                                                              child: TextFormField(
                                                                                decoration: InputDecoration(
                                                                                  enabledBorder: UnderlineInputBorder(
                                                                                    borderSide: BorderSide(color: textcolor),
                                                                                  ),
                                                                                  focusedBorder: UnderlineInputBorder(
                                                                                    borderSide: BorderSide(color: containercolor),
                                                                                  ),
                                                                                  hintText: language ? '행성 이름' : "Planet name",
                                                                                  hintStyle: TextStyle(color: textcolor, fontSize: 16, fontFamily: font1),
                                                                                  suffixText: language ? '행성' : "planet",
                                                                                  suffixStyle: TextStyle(color: containercolor, fontSize: 15, fontFamily: font1),
                                                                                ),
                                                                                controller: _abputmeController,
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 20, right: 20),
                                                                              child: Row(
                                                                                children: [
                                                                                  Text(
                                                                                    language ? '비공개 설정' : 'Private setting',
                                                                                    style: TextStyle(fontFamily: font1, fontSize: 16, color: Colors.black),
                                                                                  ),
                                                                                  Spacer(),
                                                                                  Transform.scale(
                                                                                    scale: 0.8,
                                                                                    child: CupertinoSwitch(
                                                                                      activeColor: containercolor,
                                                                                      value: toggle,
                                                                                      onChanged: (val) {
                                                                                        stateSetter(() => toggle = val);
                                                                                      },
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 20,
                                                                            ),
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                              children: [
                                                                                Container(
                                                                                  height: 50,
                                                                                  width: MediaQuery.of(context).size.width / 2.5,
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(50),
                                                                                    child: RaisedButton(
                                                                                      child: Text(
                                                                                        language ? '취소' : 'cancel',
                                                                                        style: TextStyle(color: modalbutton, fontSize: 16, fontFamily: font1),
                                                                                      ),
                                                                                      onPressed: () {},
                                                                                      color: modal,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  height: 50,
                                                                                  width: MediaQuery.of(context).size.width / 2.5,
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(50),
                                                                                    child: RaisedButton(
                                                                                      child: InkWell(
                                                                                        child: Text(
                                                                                          language ? '추가' : 'Add',
                                                                                          style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: font1),
                                                                                        ),
                                                                                      ),
                                                                                      onPressed: addbutton
                                                                                          ? null
                                                                                          : () async {
                                                                                              print(selectedplanet);
                                                                                              print(_abputmeController.text);
                                                                                              print(toggle);
                                                                                              stateSetter(() {
                                                                                                addbutton = true;
                                                                                              });
                                                                                              await instans.collection("Planets").add({
                                                                                                'planetname': _abputmeController.text,
                                                                                                'selected': selectedplanet.toString(),
                                                                                                'private': toggle,
                                                                                                'userid': userFirebaseID,
                                                                                                'items': 0,
                                                                                                'datetime': DateTime.now()
                                                                                              }).then((value) {
                                                                                                listItem2.add(_abputmeController.text);

                                                                                                listItem2Ids.add(value.id);
                                                                                                stateSetter(() {
                                                                                                  addbutton = false;
                                                                                                });
                                                                                                Navigator.pop(context);
                                                                                                showSnackbar("New Planet has been Added");
                                                                                              });

                                                                                              // Navigator.pop(context);
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
                                                                      );
                                                                    },
                                                                  ),
                                                                );
                                                              });
                                                        },
                                                        child: Container(
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Image.asset(
                                                                'assets/doted.png',
                                                                height: 44.93,
                                                                width: 44.93,
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                language
                                                                    ? '행성 추가'
                                                                    : 'Add planet',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        16,
                                                                    color:
                                                                        textcolor),
                                                              )
                                                            ],
                                                          ),
                                                          height: 127,
                                                          width: 154,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                  SizedBox(
                                    height: 20,
                                  )
                                ],
                              ),
                            SizedBox(
                              height: 20,
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
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showSnackbar(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }
}
