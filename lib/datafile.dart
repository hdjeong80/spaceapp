import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

final Controllerinput = TextEditingController();
final Controllerinput1 = TextEditingController();
final Controllerinput2 = TextEditingController();
final Controllerinput3 = TextEditingController();
final Controllerinput4 = TextEditingController();
final Controllerinput5 = TextEditingController();
final Controllerinput6 = TextEditingController();
final Controllerinput7 = TextEditingController();
String valuechose2;
List<Asset> images = <Asset>[];
List listItem2 = [];
List listItem2Ids = [];
int choseenindex = -1;
FirebaseFirestore instans = FirebaseFirestore.instance;
String userFirebaseID;
String prephone = "+82";
String phone;
String uniqueuser;
String address;
String UserImage;
String UserAbout;
bool UserNotification;
bool language = true;

int check = 0;
int check1 = 0;
int check2 = 0;
int check3 = 0;
bool buttondisable = true;

bool doublecheckbutton = false;

String UserUUID;

int input = 1;
int input1 = 1;
int input2 = 1;
int input3 = 1;
int input4 = 1;
int input5 = 1;
int input6 = 1;
int input7 = 1;
int input8 = 1;

String idforclick;

List<String> links;
