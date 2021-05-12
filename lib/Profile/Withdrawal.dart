import 'package:flutter/material.dart';
import 'package:spaceapp/color.dart';

import '../datafile.dart';

class Withdrawal extends StatefulWidget {
  @override
  _WithdrawalState createState() => _WithdrawalState();
}

class _WithdrawalState extends State<Withdrawal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          language ? '회원탈퇴' : 'WithDrawal',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 25,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  language ? '계정 삭제하기' : 'Delete your account',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    child: Text(
                  language
                      ? '계정을 삭제하면 행성, 거래내역, 채팅 내역 등 앱 내의 모든 활동 정보가 삭제됩니다. 계정 삭제 후 7일 간 다시 가입할 수 없으니 유의해주세요!'
                      : 'When you delete your account, all activity information in the app, such as planets, transactions, and chat history, will be deleted. Please note that you will not be able to sign up again for 7 days after deleting your account!',
                  style: TextStyle(fontSize: 16),
                )),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'Appsetting');
                    },
                    child: Text(
                      language
                          ? '지구로 돌아가시겠습니까?'
                          : 'Would you like to return to Earth?',
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                    child: Text(
                  language
                      ? "'삭제 버튼을 누르시면 ‘우주공간'에서의 우주 활동은 모두 안드로메다(삭제) 처리가 됩니다 😭신중하게 고려해주세요! "
                      : "If you click the delete button, all space activities in'space' will be treated as Andromeda (delete) 😭Please consider carefully!",
                  style: TextStyle(fontSize: 16),
                )),
                SizedBox(height: 40),
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
                            language ? '더 사용하기' : 'Use more',
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
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: RaisedButton(
                          child: Text(
                            language ? '삭제하겠습니다' : "I'll delete it",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: font1),
                          ),
                          onPressed: () {
                            //    Navigator.pushNamed(context, "Gender");
                          },
                          color: buttoncolor4,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
