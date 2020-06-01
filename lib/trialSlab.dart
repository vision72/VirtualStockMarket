import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vsm/model/market.dart';

import 'MaterialColors.dart';
import 'app_data/app_data.dart';
import 'model/trial.dart';

class TrialSlab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TrialSlabState();
}

class TrialSlabState extends State<TrialSlab> {
  int profit = 0, currentQuantPurchased = 0;
  @override
  Widget build(BuildContext context) {
    print(Trial.setStocks);
    print(Trial.difference);
    for (int i = 0; i < 3; i++) {
      Trial.setStocks[i][AppData.trialRound + 1] > 0
          ? currentQuantPurchased =
              Trial.setStocks[i][AppData.trialRound + 1]
          : currentQuantPurchased = 0;
      profit += (currentQuantPurchased *
          (Trial.difference[AppData.trialRound + 1][i]));
    }

    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
  
    dynamic netWorth = profit;
    
    // for (int i = 0; i < 5; i++) {
    //  // networth =
    //   // netWorth +=
    //   //     Trial.stocks[i] * Trial.sellingPrice[i][AppData.trialRound + 1] -
    //   //         (15 - Trial.currentstock[i]) *
    //   //             Trial.sellingPrice[i][AppData.trialRound + 2];

    // }
    

    // this is the networth value
    // Update from the database

    Color c;
    if (netWorth < 500) {
      c = Colors.indigo;
    } else if (netWorth >= 500 && netWorth < 1500) {
      c = Colors.red;
    } else if (netWorth >= 1500 && netWorth < 5000) {
      c = Colors.orange;
    } else if (netWorth >= 5000 && netWorth < 7500) {
      c = Colors.yellow;
    } else if (netWorth >= 7500 && netWorth < 10000) {
      c = Colors.green;
    } else if (netWorth >= 10000) {
      c = Colors.purpleAccent;
    }
   

    AppData.prevNetWorth = netWorth;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: MaterialColors.mpurple1,
          title: RichText(
            text: TextSpan(
                text: "Market Closedown ",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30.0)),
          ),
        ),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                  top: deviceHeight * .05, left: deviceWidth * 0.05),
              color: MaterialColors.mblue,
              height: deviceHeight * .16,
              width: deviceWidth * .70,
              child: Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                      text: "Market Closedown!",
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w400,
                          fontSize: 22.0,
                          fontFamily: 'Helvetica')),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: deviceHeight * .14, left: deviceWidth * .05),
              color: c,
              child: Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                      text: "Networth : " + netWorth.toString(),
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w400,
                          fontSize: 22.0,
                          fontFamily: 'Helvetica')),
                ),
              ),
              height: deviceHeight * .1,
              width: deviceWidth * .70,
            ),
            Container(
              margin: EdgeInsets.only(
                  top: deviceHeight * .04, right: deviceWidth * .04),
              child: Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  child: Icon(Icons.navigate_next),
                  splashColor: MaterialColors.mpurple1,
                  onPressed: () {
                    for (int i = 0; i < 3; i++) {
                      Trial.currentstock[i] = 10;
                    }
                    AppData.trialRound++;
                     if (AppData.trialRound == 1) {
                     Navigator.pushReplacementNamed(context, '/trail');
                      }
                    else
                    Navigator.pushReplacementNamed(context, '/trialPage');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
