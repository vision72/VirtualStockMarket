import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vsm/TrialPage.dart';
import 'app_data/app_data.dart';
import 'database_helper.dart';
import 'model/market.dart';
import 'model/trial.dart';

class TrialSponsorPage extends StatefulWidget {
  @override
  _TrialSponsorPageState createState() => _TrialSponsorPageState();
}

class _TrialSponsorPageState extends State<TrialSponsorPage> {
  TextEditingController roundController = TextEditingController();
  bool _correctRound = true;

  @override
  Widget build(BuildContext context) {

    print(AppData.trialRound + 1);
    return Scaffold(
      appBar: AppBar(
        title: Text("Round " + (AppData.trialRound + 1 + 1).toString()),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 20.0),
            child: Image.asset(AppData.sponsorImages[AppData.trialRound + 1],
                scale: 1.4, width: 180.0, height: 180.0),
          ),
          // Container(
          //   padding: EdgeInsets.only(top: 10.0),
          //   child: Align(
          //     child: FloatingActionButton.extended(onPressed: null, label: Text("Back")),
          //     alignment: Alignment.bottomLeft,
          //   ),
          // ),
          Container(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                errorText: _correctRound ? null : "Enter a valid Round code",
                border: OutlineInputBorder(),
              ),
              controller: roundController,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20.0, left: 10.0, bottom: 90.0),
            child: Align(
              alignment: Alignment.center,
              child: FloatingActionButton(
                child: Icon(Icons.add_alarm),
                onPressed: () {
                  String roundCode =
                      roundController.text.toString().toLowerCase();
                  if (roundCode ==
                      AppData.sponsorCodes[AppData.trialRound + 1]) {
                   
                    Navigator.pushReplacementNamed(context, '/trialPage');
                  } else {
                    setState(() {
                      _correctRound = false;
                    });
                  }
                },
                elevation: 10.0,
              ),
            ),
          ),
          Container(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * .07),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: FloatingActionButton.extended(
                  heroTag: "btn1",
                  icon: Icon(Icons.navigate_before),
                  onPressed: () {
                    Trial.isButtonDisabled = true;
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/trialPage', (Route<dynamic> route) => false);
                  },
                  label: Text("Back")),
            ),
          ),
        ],
      ), //   <-- image
    );
  }
}
