import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../color.dart';
import '../datafile.dart';

class Editprofile extends StatefulWidget {
  @override
  _EditprofileState createState() => _EditprofileState();
}


class _EditprofileState extends State<Editprofile> {

  TextEditingController _nicnameController;
  TextEditingController _areinputController;
  TextEditingController _abputmeController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("URL :: "+ UserImage);
     _nicnameController= TextEditingController()..text = uniqueuser;
    _areinputController= TextEditingController()..text = address;
    _abputmeController= TextEditingController()..text = UserAbout;
  }
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool buttonconfirm=false;
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  Future<String> uploadPic() async {
    Reference ref = FirebaseStorage.instance.ref().child('profile_image_' + DateTime.now().toString());
    UploadTask uploadTask = ref.putFile(_image);

    String imageUrl = await (await uploadTask).ref.getDownloadURL();
    return imageUrl.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: bgcolor,
      appBar: AppBar(

        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(language?'프로필 수정':'Edit Profile',style: TextStyle(color: textcolor3,fontSize: 16),),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,size: 25,),onPressed: (){
          Navigator.pop(context);
        },),
      ),
      body: SafeArea(
        child: Column(
          children: [

            Expanded(
              child: SingleChildScrollView(
                child: Column(

                  children: [
                    SizedBox(height: 100,),
                    Container(

                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 75.0),
                            alignment: Alignment.topCenter,
                            height: MediaQuery.of(context).size.height/1,
                            color: Colors.transparent,
                            child: new Container(
                              decoration: new BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: new BorderRadius.only(
                                    topLeft: const Radius.circular(40.0),
                                    topRight: const Radius.circular(40.0),
                                  )
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(child: _image != null?    Container(
                              width: 100,
                            height: 100,

                          // child: Icon(CustomIcons.option, size: 20,),
                            decoration: BoxDecoration(

                                shape: BoxShape.circle,
                                color: Colors.black),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                      child: Image.file(_image,height: 80,width: 80,fit: BoxFit.fill)))
                              :InkWell(
                                onTap: (){
                                  print('in get image');
                                  getImage();
                                },
                                child: Container(
                                    width: 80,
                                    height: 80,

                                    // child: Icon(CustomIcons.option, size: 20,),
                                    decoration: BoxDecoration(

                                        shape: BoxShape.circle,
                                        color: Colors.white),
                                    child: UserImage==null ? Center(child:  Image.asset('assets/camera.png',height: 101,width: 101,)
                                    ):Center(
                                child: Container(
                                  width: 100,
                                  height: 100,
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
                                    placeholder: (context, url) => CircularProgressIndicator(),
                                    errorWidget: (context, url, error) => Icon(Icons.person),
                                  ),
                                ),
            ),


                                ),
                              ),
                              ),

                              SizedBox(height: 20,),
                              Padding(
                                padding: const EdgeInsets.only(left: 20,right: 20),
                                child: Text(language?'닉네임':'nickname' ,style: TextStyle(fontFamily: font1,fontSize: 12,color: textcolor2,fontWeight: FontWeight.bold),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20 , right: 20),
                                child: TextFormField(
                                  controller: _nicnameController,
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color:modal),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: modal),
                                    ),
                                    hintText: language? '우주공간_우주인1305호':"Space_Spaceman 1305", hintStyle: TextStyle(
                                      color: textcolor3, fontSize: 16, fontFamily: font1,fontWeight: FontWeight.w200),
                                      suffix:GestureDetector(
                                        onTap: doublecheckbutton?null:(){
                                          if(_nicnameController.text.length>=4)
                                          {
                                            setState(() {
                                              doublecheckbutton=true;
                                            });
                                            instans.collection('Users').where('username',isEqualTo: _nicnameController.text).get().then((QuerySnapshot querydata){
                                              if(querydata.docs.isNotEmpty){
                                                showSnackbar("This username is already exists");
                                                setState(() {
                                                  doublecheckbutton=false;
                                                });
                                              }
                                              else{
                                                showSnackbar("Username is Available");
                                                print('Username is Available');
                                                setState(() {
                                                  doublecheckbutton=false;
                                                });
                                              }

                                            });
                                          }
                                          else{
                                            showSnackbar("Username should be more than 4 char");
                                          }

                                        },
                                        child:Text( language? '중복확인':"Double Check", style: TextStyle(color: containercolor, fontSize: 15, fontFamily: font1),),
                                      ),
                                  ),
                                  ),
                                ),
                              SizedBox(height: 20,),
                              Padding(
                                padding: const EdgeInsets.only(left: 20,right: 20),
                                child: Text(language?'지역 입력':'Area input' ,style: TextStyle(fontFamily: font1,fontSize: 12,color: textcolor2,fontWeight: FontWeight.bold),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20 , right: 20),
                                child: TextFormField(
                                  maxLength: 10,
                                  controller: _areinputController,
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color:modal),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: modal),
                                    ),
                                    hintText: language? '서울특별시 마곡동':"Magok-dong, Seoul", hintStyle: TextStyle(
                                      color: textcolor3, fontSize: 16, fontFamily: font1,fontWeight: FontWeight.w200),
                                    //suffixText: language? '9/10':"9/10", suffixStyle: TextStyle(color: textcolor, fontSize: 15, fontFamily: font1),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20,),
                              Padding(
                                padding: const EdgeInsets.only(left: 20,right: 20),
                                child: Text(language?'내 소개':'About me' ,style: TextStyle(fontFamily: font1,fontSize: 12,color: textcolor2,fontWeight: FontWeight.bold),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20 , right: 20),
                                child: TextFormField(
                                  controller: _abputmeController,
                                  maxLines: null,
                                  cursorColor: containercolor,
                                  keyboardType: TextInputType.multiline,
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color:modal),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: modal),
                                    ),
                                    hintText: language? '평소 축구를 좋아하고, 게임을 즐겨합니다.포켓몬도 좋아해요!':"I usually like soccer and I enjoy playing games.I also like Pokemon!", hintStyle: TextStyle(
                                      color: textcolor3, fontSize: 16, fontFamily: font1,fontWeight: FontWeight.w200),
                                  ),
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
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              color: containercolor,
              child: FlatButton(
                child: Text(language?'변경하기':'Change',style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                onPressed: (){
                  print("in text feild :: "+_nicnameController.text);
               //   print("in text feild :: "+uniqueuser);
                  if(_nicnameController.text!=uniqueuser)
                    {
                      print('here');
                      instans.collection('Users').where('username',isEqualTo: _nicnameController.text).get().then((QuerySnapshot querydata)async{
                        if(querydata.docs.isNotEmpty){

                          showSnackbar("nickname is already exists");


                        }
                        else{
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (dialogContext) {
                                return StatefulBuilder(
                                    builder: (context, setState) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(20.0))
                                        ),
                                        content: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                  height: 36.17,
                                                  width: 36.17,
                                                  decoration: BoxDecoration(
                                                    color: buttoncolor2,
                                                    borderRadius: BorderRadius.circular(20),
                                                  ),
                                                  child: InkWell(
                                                      onTap: (){

                                                        Navigator.pop(dialogContext);

                                                      },
                                                      child: Icon
                                                        (Icons.close)),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 20,),
                                            Center(child: Container(
                                              width: MediaQuery.of(context).size.width/2,
                                              child: RichText(
                                                text: TextSpan(text: "Are you sure ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16,fontFamily: font1),
                                                    children: [
                                                      TextSpan(text: ' you want to update!',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w100,color: Colors.black,fontFamily: font1))
                                                    ]
                                                ),
                                              ),)),
                                            SizedBox(height: 20,),
                                            Center(
                                              child: Container(
                                                height: 50,
                                                width: MediaQuery.of(context).size.width/2.5,
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(50),
                                                  child: RaisedButton(
                                                    child: Text(language?'확인':'Confirm',style: TextStyle(color: Colors.white,fontSize: 16, fontFamily: font1),),
                                                    onPressed: buttonconfirm?null:()async{
                                                      if(_nicnameController.text.length>=4)
                                                      {
                                                        // Navigator.of(context).pop();
                                                        setState(() {
                                                          buttonconfirm=true;
                                                        });
                                                        //showSnackbar("Username is Available");
                                                        // print('Username is Available');
                                                        String getURL;
                                                        if(_image!=null)
                                                        {
                                                          getURL= await uploadPic();
                                                          if(getURL.isNotEmpty){
                                                            if(_nicnameController.text==uniqueuser)
                                                            {
                                                              await instans.collection("Users")
                                                                  .doc(userFirebaseID)
                                                                  .update({
                                                                'address':_areinputController.text,
                                                                'imageurl':getURL,
                                                                'about':_abputmeController.text,

                                                              }).then((value) {
                                                                address=_areinputController.text;
                                                                UserImage=getURL;
                                                                UserAbout=_abputmeController.text;

                                                                setState(() {
                                                                  buttonconfirm=false;
                                                                });
                                                                showSnackbar("Details has been updated");
                                                                Navigator.of(context).pop();
                                                                Navigator.of(context).pop();
                                                              });
                                                            }else{
                                                              await instans.collection("Users")
                                                                  .doc(userFirebaseID)
                                                                  .update({
                                                                'address':_areinputController.text,
                                                                'username': _nicnameController.text,
                                                                'imageurl':getURL,
                                                                'about':_abputmeController.text,

                                                              }).then((value) {
                                                                uniqueuser=_nicnameController.text;
                                                                address=_areinputController.text;
                                                                UserImage=getURL;
                                                                UserAbout=_abputmeController.text;

                                                                setState(() {
                                                                  buttonconfirm=false;
                                                                });
                                                                showSnackbar("Details has been updated");
                                                                Navigator.of(context).pop();
                                                              });
                                                            }

                                                          }
                                                        }
                                                        else {

                                                          if(_nicnameController.text==uniqueuser)
                                                          {
                                                            await instans.collection("Users")
                                                                .doc(userFirebaseID)
                                                                .update({
                                                              'address':_areinputController.text,
                                                              'about':_abputmeController.text,

                                                            }).then((value) {
                                                              address=_areinputController.text;
                                                              UserAbout=_abputmeController.text;

                                                              setState(() {
                                                                buttonconfirm=false;
                                                              });
                                                              showSnackbar("Details has been updated");
                                                              Navigator.of(context).pop();
                                                            });
                                                          }else{
                                                            await instans.collection("Users")
                                                                .doc(userFirebaseID)
                                                                .update({
                                                              'username': _nicnameController.text,
                                                              'address':_areinputController.text,
                                                              'about':_abputmeController.text,

                                                            }).then((value) {
                                                              uniqueuser=_nicnameController.text;
                                                              address=_areinputController.text;
                                                              UserAbout=_abputmeController.text;

                                                              setState(() {
                                                                buttonconfirm=false;
                                                              });
                                                              showSnackbar("Details has been updated");
                                                              Navigator.of(context).pop();
                                                            });
                                                          }

                                                        }



                                                      }
                                                      else{
                                                        showSnackbar("Username should be more than 4 char");
                                                      }

                                                    },
                                                    color: containercolor,
                                                  ),
                                                ),
                                              ),
                                            ),

                                          ],
                                        ),


                                      );
                                    }
                                );
                              });
                        }
                      });
                    }
                  else{
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (dialogContext) {
                          return StatefulBuilder(
                              builder: (context, setState) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20.0))
                                  ),
                                  content: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            height: 36.17,
                                            width: 36.17,
                                            decoration: BoxDecoration(
                                              color: buttoncolor2,
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            child: InkWell(
                                                onTap: buttonconfirm?null:(){

                                                  Navigator.pop(dialogContext);
                                                },
                                                child: Icon
                                                  (Icons.close)),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20,),
                                      Center(child: Container(
                                        width: MediaQuery.of(context).size.width/2,
                                        child: RichText(
                                          text: TextSpan(text: "Are you sure ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16,fontFamily: font1),
                                              children: [
                                                TextSpan(text: ' you want to update!',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w100,color: Colors.black,fontFamily: font1))
                                              ]
                                          ),
                                        ),)),
                                      SizedBox(height: 20,),
                                      Center(
                                        child: Container(
                                          height: 50,
                                          width: MediaQuery.of(context).size.width/2.5,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(50),
                                            child: RaisedButton(
                                              child: Text(language?'확인':'Confirm',style: TextStyle(color: Colors.white,fontSize: 16, fontFamily: font1),),
                                              onPressed: buttonconfirm?null:()async{
                                                if(_nicnameController.text.length>=4)
                                                {
                                                  // Navigator.of(context).pop();
                                                  setState(() {
                                                    buttonconfirm=true;
                                                  });
                                                  //showSnackbar("Username is Available");
                                                  // print('Username is Available');
                                                  String getURL;
                                                  if(_image!=null)
                                                  {
                                                    getURL= await uploadPic();
                                                    if(getURL.isNotEmpty){
                                                      if(_nicnameController.text==uniqueuser)
                                                      {
                                                        await instans.collection("Users")
                                                            .doc(userFirebaseID)
                                                            .update({
                                                          'address':_areinputController.text,
                                                          'imageurl':getURL,
                                                          'about':_abputmeController.text,

                                                        }).then((value) {
                                                          address=_areinputController.text;
                                                          UserImage=getURL;
                                                          UserAbout=_abputmeController.text;

                                                          setState(() {
                                                            buttonconfirm=false;
                                                          });
                                                          showSnackbar("Details has been updated");
                                                          Navigator.of(context).pop();
                                                        });
                                                      }else{
                                                        await instans.collection("Users")
                                                            .doc(userFirebaseID)
                                                            .update({
                                                          'address':_areinputController.text,
                                                          'username': _nicnameController.text,
                                                          'imageurl':getURL,
                                                          'about':_abputmeController.text,

                                                        }).then((value) {
                                                          uniqueuser=_nicnameController.text;
                                                          address=_areinputController.text;
                                                          UserImage=getURL;
                                                          UserAbout=_abputmeController.text;

                                                          setState(() {
                                                            buttonconfirm=false;
                                                          });
                                                          showSnackbar("Details has been updated");
                                                          Navigator.of(context).pop();
                                                        });
                                                      }

                                                    }
                                                  }
                                                  else {

                                                    if(_nicnameController.text==uniqueuser)
                                                    {
                                                      await instans.collection("Users")
                                                          .doc(userFirebaseID)
                                                          .update({
                                                        'address':_areinputController.text,
                                                        'about':_abputmeController.text,

                                                      }).then((value) {
                                                        address=_areinputController.text;
                                                        UserAbout=_abputmeController.text;

                                                        setState(() {
                                                          buttonconfirm=false;
                                                        });
                                                        showSnackbar("Details has been updated");
                                                        Navigator.of(context).pop();
                                                      });
                                                    }else{
                                                      await instans.collection("Users")
                                                          .doc(userFirebaseID)
                                                          .update({
                                                        'username': _nicnameController.text,
                                                        'address':_areinputController.text,
                                                        'about':_abputmeController.text,

                                                      }).then((value) {
                                                        uniqueuser=_nicnameController.text;
                                                        address=_areinputController.text;
                                                        UserAbout=_abputmeController.text;

                                                        setState(() {
                                                          buttonconfirm=false;
                                                        });
                                                        showSnackbar("Details has been updated");
                                                        Navigator.of(context).pop();
                                                      });
                                                    }

                                                  }



                                                }
                                                else{
                                                  showSnackbar("Username should be more than 4 char");
                                                }

                                              },
                                              color: containercolor,
                                            ),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),


                                );
                              }
                          );
                        });
                  }


                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  void showSnackbar(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }
}
