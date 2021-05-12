import 'package:flutter/material.dart';

import '../color.dart';
import '../datafile.dart';

class Chatdefault extends StatefulWidget {
  @override
  _ChatdefaultState createState() => _ChatdefaultState();
}

class _ChatdefaultState extends State<Chatdefault> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(language?'우주톡 👽':'Yoongi pics 👽',style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, 'Chatsettings');
                  },
                  child: Container(
                    // height: 66,
                    width: MediaQuery.of(context).size.width/1.1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: AssetImage('assets/avatar.png')
                                ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(text: language?'해리포터 ':'Harry Potter ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16,fontFamily: font1),
                                      children: [
                                        TextSpan(text: language?'행성':'Planet',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w100,color: Colors.black,fontFamily: font1))
                                      ]
                                  ),
                                ),
                                Container(
                                    width: MediaQuery.of(context).size.width/2,
                                    child: Text(language?'노트북을 구매하고 싶은데 지역...':'I would like to buy a laptop, but the region...',style: TextStyle(fontSize: 15,fontFamily: font1),)),
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 58,
                            width: 83,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: AssetImage('assets/mac.jpg')
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  // height: 66,
                  width: MediaQuery.of(context).size.width/1.1,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage('assets/avatar.png')
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(text: language?'해리포터 ':'Harry Potter ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16,fontFamily: font1),
                                    children: [
                                      TextSpan(text: language?'행성':'Planet',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w100,color: Colors.black,fontFamily: font1))
                                    ]
                                ),
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width/2,
                                  child: Text(language?'노트북을 구매하고 싶은데 지역...':'I would like to buy a laptop, but the region...',style: TextStyle(fontSize: 15,fontFamily: font1),)),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 58,
                          width: 83,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage('assets/mac.jpg')
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  // height: 66,
                  width: MediaQuery.of(context).size.width/1.1,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage('assets/avatar.png')
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(text: language?'해리포터 ':'Harry Potter ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16,fontFamily: font1),
                                    children: [
                                      TextSpan(text: language?'행성':'Planet',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w100,color: Colors.black,fontFamily: font1))
                                    ]
                                ),
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width/2,
                                  child: Text(language?'노트북을 구매하고 싶은데 지역...':'I would like to buy a laptop, but the region...',style: TextStyle(fontSize: 15,fontFamily: font1),)),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 58,
                          width: 83,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage('assets/mac.jpg')
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  // height: 66,
                  width: MediaQuery.of(context).size.width/1.1,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage('assets/avatar.png')
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(text: language?'해리포터 ':'Harry Potter ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16,fontFamily: font1),
                                    children: [
                                      TextSpan(text: language?'행성':'Planet',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w100,color: Colors.black,fontFamily: font1))
                                    ]
                                ),
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width/2,
                                  child: Text(language?'노트북을 구매하고 싶은데 지역...':'I would like to buy a laptop, but the region...',style: TextStyle(fontSize: 15,fontFamily: font1),)),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 58,
                          width: 83,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage('assets/mac.jpg')
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  // height: 66,
                  width: MediaQuery.of(context).size.width/1.1,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage('assets/avatar.png')
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(text: language?'해리포터 ':'Harry Potter ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16,fontFamily: font1),
                                    children: [
                                      TextSpan(text: language?'행성':'Planet',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w100,color: Colors.black,fontFamily: font1))
                                    ]
                                ),
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width/2,
                                  child: Text(language?'노트북을 구매하고 싶은데 지역...':'I would like to buy a laptop, but the region...',style: TextStyle(fontSize: 15,fontFamily: font1),)),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 58,
                          width: 83,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage('assets/mac.jpg')
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  // height: 66,
                  width: MediaQuery.of(context).size.width/1.1,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage('assets/avatar.png')
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(text: language?'해리포터 ':'Harry Potter ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16,fontFamily: font1),
                                    children: [
                                      TextSpan(text: language?'행성':'Planet',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w100,color: Colors.black,fontFamily: font1))
                                    ]
                                ),
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width/2,
                                  child: Text(language?'노트북을 구매하고 싶은데 지역...':'I would like to buy a laptop, but the region...',style: TextStyle(fontSize: 15,fontFamily: font1),)),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 58,
                          width: 83,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage('assets/mac.jpg')
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  // height: 66,
                  width: MediaQuery.of(context).size.width/1.1,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage('assets/avatar.png')
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(text: language?'해리포터 ':'Harry Potter ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16,fontFamily: font1),
                                    children: [
                                      TextSpan(text: language?'행성':'Planet',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w100,color: Colors.black,fontFamily: font1))
                                    ]
                                ),
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width/2,
                                  child: Text(language?'노트북을 구매하고 싶은데 지역...':'I would like to buy a laptop, but the region...',style: TextStyle(fontSize: 15,fontFamily: font1),)),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 58,
                          width: 83,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage('assets/mac.jpg')
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
