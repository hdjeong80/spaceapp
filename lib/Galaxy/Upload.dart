import 'dart:typed_data';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spaceapp/color.dart';
import 'package:spaceapp/datafile.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_store;

class Upload extends StatefulWidget {
  @override
  _UploadState createState() => _UploadState();
}

bool toggle = false;

class _UploadState extends State<Upload> {
  CollectionReference imgRef;
  firebase_store.Reference ref;
  bool registerbutton = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final articalController = TextEditingController();
  final detailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Widget image_slider_carousel = Container(
      height: 347,
      width: MediaQuery.of(context).size.width,
      child: Carousel(
        boxFit: BoxFit.fill,
        images: List.generate(images.length, (index) {
          Asset asset = images[index];
          return AssetThumb(
            asset: asset,
            height: 347,
            width: MediaQuery.of(context).size.width.toInt(),
          );
        }),
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
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 30,
              color: textcolor2,
            ),
            onPressed: () => Navigator.pop(context)),
        centerTitle: true,
        title: Text(language ? '아이템 업로드' : 'Upload item',
            style: TextStyle(
                fontSize: 16, fontFamily: font1, color: Colors.black)),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              image_slider_carousel,
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        controller: articalController,
                        decoration: InputDecoration(
                          // border: OutlineInputBorder(),
                          labelText: language ? '글 제목' : 'Article title',
                          hintText: language ? '글 제목' : 'Article title',
                        ),
                      )
                      //Text(language?'글 제목':'Article title',style: TextStyle(fontFamily: font1, color: modalbutton, fontSize: 16,fontWeight: FontWeight.bold)),
                      ),
                  //Divider(),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: ListTile(
                      title: Row(
                        children: [
                          Text(
                            language ? '행성' : 'Language',
                            style: TextStyle(
                                color: buttoncolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          Spacer(),
                          RichText(
                            text: TextSpan(
                              text: valuechose2,
                              style: TextStyle(
                                  color: textcolor3,
                                  fontSize: 16,
                                  fontFamily: font1,
                                  fontWeight: FontWeight.bold),
                              children: <TextSpan>[
                                TextSpan(
                                    text: language ? ' 행성' : ' planet ',
                                    style: TextStyle(
                                        fontFamily: font1,
                                        fontSize: 16,
                                        color: textcolor3,
                                        fontWeight: FontWeight.w100)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 20),
                    child: Container(
                      height: 134.39,
                      width: MediaQuery.of(context).size.width / 1.2,
                      color: container,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: TextField(
                          controller: detailController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: language
                                  ? '내용을 입력해주세요.'
                                  : 'Please enter your details.',
                              hintStyle: TextStyle(
                                  fontSize: 16,
                                  color: modalbutton,
                                  fontFamily: font1)),
                          maxLines: null,
                          cursorColor: containercolor,
                          expands: true,
                          keyboardType: TextInputType.multiline,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0, right: 0),
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width / 3,
                              child: Text(
                                language
                                    ? '상세정보 입력'
                                    : 'Enter detailed information',
                                style:
                                    TextStyle(color: textcolor, fontSize: 16),
                              )),
                          Spacer(),
                          Text(
                            language ? '카테고리 선택' : 'Select a category',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      trailing: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, 'Category');
                          },
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.black,
                            ),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Divider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          language ? '거래제안' : 'Transaction Proposal',
                          style: TextStyle(color: textcolor, fontSize: 16),
                        ),
                        Spacer(),
                        Container(
                          child: Transform.scale(
                            scale: 0.8,
                            child: CupertinoSwitch(
                              value: toggle,
                              onChanged: (value) {
                                setState(() {
                                  toggle = value;
                                });
                              },
                              activeColor: containercolor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                //color: containercolor,
                child: RaisedButton(
                  color: containercolor,
                  child: Text(
                    language ? '등록하기' : 'Registration',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: registerbutton
                      ? null
                      : () async {
                          if (articalController.text == "") {
                            showSnackbar("please add the title");
                          } else if (detailController.text == "") {
                            showSnackbar("please add the Details");
                          } else if (input == 1 &&
                              input2 == 1 &&
                              input3 == 1 &&
                              input4 == 1 &&
                              input5 == 1 &&
                              input6 == 1 &&
                              input7 == 1 &&
                              input8 == 1) {
                            showSnackbar("Please enter detailed information");
                          } else {
                            buildLoading(context);
                            setState(() {
                              registerbutton = true;
                            });

                            print("artical :: " + articalController.text);
                            print("planet id :: " + listItem2Ids[choseenindex]);
                            print("details :: " + detailController.text);
                            print("transaction Proposal" + toggle.toString());

                            await instans.collection("Products").add({
                              'categoryID': listItem2Ids[choseenindex],
                              'userID': userFirebaseID.toString(),
                              'title': articalController.text,
                              'detail': detailController.text,
                              'transaction': toggle,
                              'price': Controllerinput.text,
                              'brand': Controllerinput1.text,
                              'quantity': Controllerinput2.text,
                              'purchasedate': Controllerinput3.text,
                              'wheretobuy': Controllerinput4.text,
                              'modelname': Controllerinput5.text,
                              'area': Controllerinput6.text,
                              'productno': Controllerinput7.text,
                              'datetime': DateTime.now()
                            }).then((value) async {
                              print(await uploadImage(value.id));
                              articalController.text = "";
                              detailController.text = "";
                              toggle = false;
                              setState(() {
                                registerbutton = false;
                              });
                              Navigator.of(context).pop();
                              showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (BuildContext context) =>
                                      CupertinoAlertDialog(
                                        title: new Text(
                                            language ? "업로드 완료" : "Added"),
                                        content: new Text(language
                                            ? "새로운 아이템이 업로드 되었습니다."
                                            : "New Product is Added"),
                                        actions: <Widget>[
                                          CupertinoDialogAction(
                                              child:
                                                  Text(language ? "확인" : "OK"),
                                              onPressed: () {
                                                Navigator.pop(context);
                                                Navigator.pushNamed(
                                                    context, "Feed");
                                              })
                                        ],
                                      ));
                              // Navigator.pop(context);
                              //showSnackbar("New Planet has been Added");
                            });
                          }
                        },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showSnackbar(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }

  buildLoading(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          );
        });
  }

  Future uploadImage(String pid) async {
    for (var img in images) {
      // ignore: deprecated_member_use
      ByteData byteData = await img.requestOriginal();
      List<int> imageData = byteData.buffer.asUint8List();

      UploadTask _uploadTask = firebase_store.FirebaseStorage.instance
          .ref()
          .child('product' + DateTime.now().toString())
          .putData(imageData);
      print("URL");

      var imageUrl = await (await _uploadTask).ref.getDownloadURL();
      String url = imageUrl.toString();

      await instans.collection("ProductImages").add({
        'UserID': userFirebaseID,
        'ProductID': pid,
        'URL': url,
        'datetime': DateTime.now()
      }).then((value) {
        //listItem2.add(_abputmeController.text);

        // listItem2Ids.add(value.id);
      });
      print(url);
      //  var dowurl = await (await _uploadTask.onComplete).ref.getDownloadURL();
      //  print( await (await _uploadTask.whenComplete(() => null)).ref.getDownloadURL());
      // //   StorageReference ref = FirebaseStorage.instance.ref().child(fileName);
      //    StorageUploadTask uploadTask = ref.putData(imageData);
    }
    return "Done";
  }
}
