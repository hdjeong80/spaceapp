import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
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
                                text: widget.urls.length.toString(),
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
                            widget.private ? '비공개' : '공개',
                            style: TextStyle(
                                color: Color(0xfff7c7c7c),
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
      // _error = error;
      if (images.length != 0) Navigator.pushNamed(context, 'Upload');
    });
  }
}
