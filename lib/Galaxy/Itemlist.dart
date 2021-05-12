import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spaceapp/color.dart';
import 'package:spaceapp/datafile.dart';
import 'package:shimmer/shimmer.dart';

class Itemlist extends StatefulWidget {
  String id;
  String name;
  // int totalitems;
  bool private;
  String selectedimage;
  List<String> urls;
  List<String> urls1;

  Itemlist(String id, String name, bool private, String selectedimage,
      List<String> urls, List<String> urls1) {
    this.id = id;
    this.name = name;
    //this.totalitems=totalitems;
    this.private = private;
    this.selectedimage = selectedimage;
    this.urls = urls;
    this.urls1 = urls1;
  }
  @override
  _ItemlistState createState() => _ItemlistState();
}

class _ItemlistState extends State<Itemlist> {
  TabController _controller;
  Widget _tabSection(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TabBar(
              controller: _controller,
              //  isScrollable: true,
              // indicatorColor: tabbarcolor,
              labelColor: Colors.black,
              // labelStyle: TextStyle(fontSize: 18.0,fontFamily: 'bold',color: color4),

              tabs: [
                Tab(text: language ? '전체' : 'All'),
                Tab(text: language ? "거래제안" : 'Transaction Proposal'),
              ]),
          Expanded(
            child: TabBarView(controller: _controller, children: [
              Container(
                  color: Colors.white30,
                  child: GridView.count(
                      crossAxisCount: 3,
                      childAspectRatio: 1.0,
                      padding: const EdgeInsets.all(4.0),
                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 4.0,
                      children: widget.urls.map((String url) {
                        return GridTile(
                            child: Image.network(url, fit: BoxFit.cover));
                      }).toList())),
              Container(
                  color: Colors.white30,
                  child: GridView.count(
                      crossAxisCount: 3,
                      childAspectRatio: 1.0,
                      padding: const EdgeInsets.all(4.0),
                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 4.0,
                      children: widget.urls1.map((String url) {
                        return GridTile(
                            child: Image.network(url, fit: BoxFit.cover));
                      }).toList())),
            ]),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 40,
        ),
        backgroundColor: containercolor,
        elevation: 0.0,
        onPressed: () {
          Navigator.pushNamed(context, 'Chatdefault');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          language ? '아이템 목록' : 'Item list',
          style:
              TextStyle(color: Colors.black, fontSize: 16, fontFamily: font1),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      StreamBuilder(
                          stream: instans
                              .collection('Products')
                              .where('categoryID', isEqualTo: widget.id)
                              .snapshots(),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshots1) {
                            if (snapshots1.data != null &&
                                snapshots1.data.docs.length > 0)
                              return StreamBuilder(
                                  stream: instans
                                      .collection('ProductImages')
                                      .where('ProductID',
                                          isEqualTo: snapshots1.data.docs[0].id)
                                      .snapshots(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<QuerySnapshot>
                                          imagesnapshot) {
                                    if (imagesnapshot.hasData &&
                                        imagesnapshot.data != null &&
                                        imagesnapshot.data.docs.length > 0)
                                      return Column(
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl: imagesnapshot.data.docs[0]
                                                ['URL'],
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Container(
                                              height: 127,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.5,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.white,
                                                image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            placeholder: (context, url) =>
                                                SizedBox(
                                              height: 127,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.5,
                                              child: Shimmer.fromColors(
                                                child: Container(
                                                  height: 127,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.5,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                baseColor: Colors.grey[200],
                                                highlightColor:
                                                    Colors.grey[350],
                                              ),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                          ),
                                        ],
                                      );
                                    else
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 127,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2.5,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Colors.grey[200],
                                            ),
                                          ),
                                        ],
                                      );
                                  });
                            else
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 127,
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.grey[200],
                                    ),
                                  ),
                                ],
                              );
                          }),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/planets/' + widget.selectedimage + '.png',
                            height: 33,
                            width: 33,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          RichText(
                            text: TextSpan(
                                text: widget.name,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    fontFamily: font1),
                                children: [
                                  TextSpan(
                                      text: language ? ' 행성' : ' Planet',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w100,
                                          color: Colors.black,
                                          fontFamily: font1))
                                ]),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          RichText(
                            text: TextSpan(
                                text: language ? '7개' : '7 ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    fontFamily: font1),
                                children: [
                                  TextSpan(
                                      text: language ? '개의 아이템' : 'items',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w100,
                                          color: Colors.black,
                                          fontFamily: font1))
                                ]),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.private.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontFamily: font1),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(child: _tabSection(context)),
          ],
        ),
      ),
    );
  }
}
