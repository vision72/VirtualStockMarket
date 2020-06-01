import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vsm/MaterialColors.dart';
import 'package:vsm/TeamModel.dart';
import 'package:vsm/database_helper.dart';
import 'package:vsm/model/profile.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  TextEditingController teamName = TextEditingController();
  TextEditingController teamCode = TextEditingController();
  bool _correctName = true, _correctCode = true;

  DatabaseHelper db = DatabaseHelper();

  Future<bool> checkLogin() async {
    return db.isLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);

    checkLogin().then((value) {
      print("Inside login then ");
      print(value);
    });

    return FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.none ||
              snapshot.connectionState == ConnectionState.waiting ||
              snapshot.hasData == null)
            return Container();
          else {
            if (snapshot.data == true) {
              print(("User is logged in"));

//              TODO: Redirect to home page

              return Container();
            } else {
              return Scaffold(
                backgroundColor: Colors.white,
                resizeToAvoidBottomPadding: true,
                body: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    SingleChildScrollView(
                      child: Padding(
                        padding:
                            EdgeInsets.only(left: 28.0, right: 28.0, top: 80.0),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(180),
                            ),
                            Stack(children: <Widget>[
                              Container(
                                  width: double.infinity,
                                  height:
                                      ScreenUtil.getInstance().setHeight(525),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8.0),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black12,
                                            offset: Offset(0.0, 15.0),
                                            blurRadius: 15.0),
                                        BoxShadow(
                                            color: Colors.black12,
                                            offset: Offset(0.0, -10.0),
                                            blurRadius: 10.0),
                                      ]),
                                  child: Stack(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 16.0, right: 16.0, top: 16.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text("Login",
                                                style: TextStyle(
                                                    fontSize:
                                                        ScreenUtil.getInstance()
                                                            .setSp(45),
                                                    fontFamily: "Poppins-Bold",
                                                    letterSpacing: .6)),
                                            SizedBox(
                                              height: ScreenUtil.getInstance()
                                                  .setHeight(30),
                                            ),
                                            Text("Team Name",
                                                style: TextStyle(
                                                    fontFamily:
                                                        "Poppins-Medium",
                                                    fontSize:
                                                        ScreenUtil.getInstance()
                                                            .setSp(26))),
                                            TextField(
                                              controller: teamName,
                                              decoration: InputDecoration(
                                                  hintText:
                                                      "Enter A Team Name.",
                                                  errorText: _correctName
                                                      ? null
                                                      : "Enter A Non Empty Alphabetic Team Name.",
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 12.0)),
                                            ),
                                            SizedBox(
                                              height: ScreenUtil.getInstance()
                                                  .setHeight(30),
                                            ),
                                            Text("Team Code",
                                                style: TextStyle(
                                                    fontFamily:
                                                        "Poppins-Medium",
                                                    fontSize:
                                                        ScreenUtil.getInstance()
                                                            .setSp(26))),
                                            TextField(
                                              controller: teamCode,
                                              decoration: InputDecoration(
                                                  errorText: _correctCode
                                                      ? null
                                                      : "Enter A Valid Team Code.",
                                                  hintText:
                                                      "Enter The Team Code Provided.",
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 12.0)),
                                            ),
                                            SizedBox(
                                              height: ScreenUtil.getInstance()
                                                  .setHeight(35),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  InkWell(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          boxShadow: [
                                            BoxShadow(
                                                color: MaterialColors.mpurple2
                                                    .withOpacity(.2),
                                                offset: Offset(1.0, 6.0),
                                                blurRadius: 2.0),
                                          ]),
                                      child: Image.asset(
                                        "assets/icon/VSMLOGO.png",
                                        width: 50.0,
                                        height: 50.0,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ]),
                            SizedBox(
                                height: ScreenUtil.getInstance().setHeight(40)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                InkWell(
                                  child: Container(
                                    width:
                                        ScreenUtil.getInstance().setWidth(330),
                                    height:
                                        ScreenUtil.getInstance().setHeight(100),
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(colors: [
                                          MaterialColors.mblue,
                                          MaterialColors.mpurple1
                                        ]),
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        boxShadow: [
                                          BoxShadow(
                                              color: MaterialColors.mpurple2
                                                  .withOpacity(.2),
                                              offset: Offset(0.0, 8.0),
                                              blurRadius: 8.0)
                                        ]),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () {
                                          String codeT =
                                              teamCode.text.toString();
                                          String nameT =
                                              teamName.text.toString();
                                          bool passName = false,
                                              passCode = false;
                                          if (nameT.isEmpty) {
                                            setState(() {
                                              _correctName = false;
                                            });
                                          } else {
                                            setState(() {
                                              _correctName = true;
                                            });
                                          }
                                          if (codeT.isEmpty) {
                                            setState(() {
                                              _correctCode = false;
                                            });
                                          } else {
                                            setState(() {
                                              _correctCode = true;
                                            });
                                          }

                                          List codes = Profile.loginCode;
                                          codes.forEach((code) {
                                            if (code.toString().toLowerCase() ==
                                                codeT.toLowerCase()) {
                                              setState(() {
                                                passCode = true;
                                                _correctCode = true;
                                              });
                                            } else if (passCode != true) {
                                              setState(() {
                                                _correctCode = false;
                                              });
                                            }
                                          });
                                          print(passCode.toString());
                                          print(_correctCode.toString());
                                          print(_correctName.toString());
                                          if (passCode &&
                                              _correctCode &&
                                              _correctName) {
                                            Profile.teamName = nameT;
                                            Profile.teamCode = codeT;
                                            Team t = Team(
                                                nameT, codeT, 0, 0, 100000, 0);
                                            db.insertTeam(t);
                                            Navigator.pushReplacementNamed(context, '/trail');
                                            // Navigator.pushReplacementNamed(
                                            //     context, '/home');
                                          } else {}
                                        },
                                        child: Center(
                                          child: Text("LOGIN",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "Poppins-Bold",
                                                  fontSize: 18,
                                                  letterSpacing: 1.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    new Container(
                      alignment: Alignment.topCenter,
                      width: 200,
                      height: 200,
                    ),
                  ],
                ),
              );
            }
          }
        },
        future: checkLogin());
  }
}
