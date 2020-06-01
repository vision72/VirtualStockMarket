import 'dart:async';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:vsm/MarketPage.dart';
import 'package:vsm/MaterialColors.dart';
import 'package:vsm/PortfolioPage.dart';
import 'package:vsm/PowercardPage.dart';
import 'package:vsm/RulesPage.dart';
import 'package:vsm/StocksPage.dart';
import 'package:vsm/model/market.dart';
import 'package:vsm/powerprofile.dart';

import 'model/market.dart';
import 'model/market.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  String cash = "";
  bool hasTimerStarted = Market.timerStarted;

  int _selectedPage = 2;
  final _pageOptions = [
    ProfilePage(),
    StockPage(),
    MarketPage(),
    PowerProfile(),
    RulesPage(),
  ];
  @override
  void initState() {
    super.initState();
    new Timer.periodic(
        Duration(seconds: 1),
        (Timer t) => setState(() {
              if (this.mounted) {
                hasTimerStarted = Market.timerStarted;
                cash = Market.userMoney.toString();
              }
            }));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedPage,
        color: MaterialColors.mpurple1,
        height: 52.0,
        backgroundColor: Colors.transparent,
        items: <Widget>[
          Icon(Icons.work, size: 30.0, color: Colors.white),
          Icon(
            Icons.adjust,
            size: 30.0,
            color: Colors.white,
          ),
          Icon(
            Icons.add_shopping_cart,
            size: 30.0,
            color: Colors.white,
          ),
          Icon(
            Icons.card_giftcard,
            size: 30.0,
            color: Colors.white,
          ),
          Icon(
            Icons.info_outline,
            size: 30.0,
            color: Colors.white,
          ),
        ],
        onTap: !hasTimerStarted
            ? (newindex) {
                setState(() {
                  _selectedPage = newindex;
                });
              }
            : null,
      ),
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
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1.5),
                    boxShadow: <BoxShadow>[
                      new BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10.0,
                          offset: new Offset(0.0, 5.0))
                    ],
                    color: MaterialColors.mpurple1,
                    borderRadius: BorderRadius.circular(5)),
                padding: EdgeInsets.all(5.0),
                child: Text(
                  "Cash : " + cash,
                  style: TextStyle(fontSize: 18),
                ),
              ))
        ],
        backgroundColor: MaterialColors.mpurple1,
      ),
      body: _pageOptions[_selectedPage],
    );
  }
}
