import 'package:flutter/material.dart';

import 'MaterialColors.dart';

class TrailRound extends StatefulWidget {
  @override
  _TrailRoundState createState() => _TrailRoundState();
}

class _TrailRoundState extends State<TrailRound> {
  @override
  Widget build(BuildContext context) {
    print("I am on the Trail Page");
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Virtual Stock Market",
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.left,
        ),
        centerTitle: false,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 10, top: 10, bottom: 10),
              child: Container(
                padding: EdgeInsets.all(5.0),
              ))
        ],
        backgroundColor: MaterialColors.mpurple1,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 2,
                top: MediaQuery.of(context).size.height / 4),
          ),
          MaterialButton(
            child: Text('Trail Rounds'),
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
            color: MaterialColors.mpurple1,
            textColor: Colors.white,
            splashColor: MaterialColors.mpurple2,
            colorBrightness: Brightness.dark,
            textTheme: ButtonTextTheme.primary,
            height: 45,
            minWidth: 150,
            elevation: 2,
            highlightElevation: 2,
            onPressed: () {
              //Do something
              Navigator.of(context).pushReplacementNamed('/trialPage');
            },
          ),
          // RaisedButton(
          //   child: Text("Trial Rounds"),
          //   onPressed: () {
          //     Navigator.of(context).pushReplacementNamed('/trialPage');
          //   },
          //   color: MaterialColors.mblue,
          //   textColor: Colors.white,
          //   padding: EdgeInsets.fromLTRB(40, 30, 40, 30),
          //   splashColor: Colors.grey,
          // ),
          Padding(
            padding: EdgeInsets.only(top: 50.0),
          ),
          MaterialButton(
            child: Text('Main Rounds'),
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
            color: MaterialColors.mpurple1,
            textColor: Colors.white,
            splashColor: MaterialColors.mpurple2,
            colorBrightness: Brightness.dark,
            textTheme: ButtonTextTheme.primary,
            height: 45,
            minWidth: 150,
            elevation: 2,
            highlightElevation: 2,
            onPressed: () {
              //Do something
              Navigator.of(context).pushReplacementNamed('/home');
            },
          ),
          // RaisedButton(
          //   child: Text("Main Rounds"),
          //   onPressed: () {
          //     Navigator.of(context).pushReplacementNamed('/home');
          //   },
          //   color: MaterialColors.mblue,
          //   textColor: Colors.white,
          //   padding: EdgeInsets.fromLTRB(40, 30, 40, 30),
          //   splashColor: Colors.grey,
          // ),
        ],
      ),
    );
  }
}
