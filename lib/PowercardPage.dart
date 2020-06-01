import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:vsm/PowerCard.dart';
import 'package:vsm/model/market.dart';

import 'MaterialColors.dart';

class PowercardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PowerCardPageState();
  }
}

class PowerCardPageState extends State<PowercardPage> {
  bool buyEnabled = Market.allowPowerCards;
  bool _invalidCode = false;

  bool useEnabled = false;
  bool hasPCode = Market.hasPowerCode;
  bool beforeRound1 = Market.allowPowerCards;
  int pCard1 = Market.boughtPowerCard1;
  int pCard2 = Market.boughtPowerCard2;
  String pCode = '';

  @override
  Widget build(BuildContext context) {
    bool powerCard1 = false, powerCard2 = false;
    pCard1 > 0 ? powerCard1 = true : powerCard1 = false;
    pCard2 > 0 ? powerCard2 = true : powerCard2 = false;

    print(powerCard1);
    // TODO: implement build
    return Container(
        padding: EdgeInsets.all(10),
        child: Stack(
          children: <Widget>[
            GridView.count(
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 10.0,
              crossAxisCount: 2,
              children: <Widget>[
                FlipCard(
                  onFlip: powerCard1
                      ? () {
                          final snackBar = SnackBar(
                            content: Text('Great Indian Sale'),
                            action: SnackBarAction(
                                label: 'Use',
                                onPressed: () {
                                  setState(() {
                                    if (Market.boughtPowerCard1 > 0 &&
                                        Market.powerCard1Active == false) {
                                      Market.powerCard1Active = true;
                                      Market.boughtPowerCard1 -= 1;
                                    }
                                  });
                                }),
                          );
                          final showRemain1 = SnackBar(
                            content: Text('Great Indian Sale(Remaining) : '+Market.boughtPowerCard1.toString() ),
                            
                          );
                          if (powerCard1 && !beforeRound1 && !Market.powerCard1Active) {
                            Scaffold.of(context).showSnackBar(snackBar);
                          }
                          else{
                            Scaffold.of(context).showSnackBar(showRemain1);
                          }
                        }
                      : null,
                  direction: FlipDirection.HORIZONTAL,
                  front: PowerCard(
                    "",
                    "",
                    1,
                    true,
                    colr: MaterialColors.mblue,
                  ),
                  back: PowerCard(
                      "COST : 5000",
                      "Get 10% discount on all the stocks in the next round.",
                      1,
                      false),
                ),
                FlipCard(
                  onFlip: powerCard2
                      ? () {
                          final snackBar = SnackBar(
                            content: Text('Big Bumper Bonus'),
                            action: SnackBarAction(
                              label: 'Use',
                              onPressed: () {
                                setState(() {
                                  if (Market.boughtPowerCard2 > 0 &&
                                      Market.powerCard2Active == false) {
                                    Market.powerCard2Active = true;
                                    Market.boughtPowerCard2 -= 1;
                                  }
                                });
                              },
                            ),
                          );
                           final showRemain2 = SnackBar(
                            content: Text('Big Bumper Bonus(Remaining) : '+Market.boughtPowerCard2.toString() ),
                            
                          );
                          if (powerCard2 && !beforeRound1 && !Market.powerCard2Active) {
                            Scaffold.of(context).showSnackBar(snackBar);
                          }
                          else{
                            Scaffold.of(context).showSnackBar(showRemain2);
                          }
                        }
                      : null,
                  direction: FlipDirection.HORIZONTAL,
                  front: PowerCard(
                    "",
                    "",
                    2,
                    true,
                    colr: MaterialColors.mblue,
                  ),
                  back: PowerCard(
                      "COST : 1000",
                      "Get 10% of your profit with a limit upto Rs 1,500",
                      2,
                      false),
                ),
              ],
            ),
            Center(
              child: Container(
                  padding: EdgeInsets.only(top: 150),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: RaisedButton(
                              textColor: Colors.white,
                              onPressed: buyEnabled
                                  ? () {
                                      int count_Card1 = Market.powerCard1;
                                      int count_Card2 = Market.powerCard2;
                                      print("Before cutting  1: " +
                                          count_Card1.toString());
                                      print("Before cutting 2 : " +
                                          count_Card2.toString());
                                      while (count_Card1 > 0) {
                                        count_Card1--;
                                        setState(() {
                                          Market.boughtPowerCard1 += 1;
                                          Market.powerCard1 -= 1;
                                          Market.availPowerCard1 -= 1;
                                          Market.userMoney -= 5000;
                                        });
                                      }
                                      while (count_Card2 > 0) {
                                        count_Card2--;
                                        setState(() {
                                          Market.boughtPowerCard2 += 1;
                                          Market.powerCard2 -= 1;
                                          Market.availPowerCard2 -= 1;
                                          Market.userMoney -= 1000;
                                        });
                                      }
                                      Market.counterResetPower = true;
                                      print("After cutting  1: " +
                                          count_Card1.toString());
                                      print("After cutting 2 : " +
                                          count_Card2.toString());
                                    }
                                  : null,
                              color: MaterialColors.mblue,
                              child: Text("Buy"),
                            ),
                          ),
                          IconButton(
                              color: MaterialColors.mpurple1,
                              onPressed: !hasPCode 
                                  ? () {
                                      _asyncInputDialog(context);
                                    }
                                  : null,
                              icon: Icon(Icons.lock))
                        ],
                      )
                    ],
                  )),
            )
          ],
        ));
  }

  Future<String> _asyncInputDialog(BuildContext context) async {
    return showDialog<String>(
      context: context,
      barrierDismissible:
          false, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Referral Code'),
          content: new Row(
            children: <Widget>[
              new Expanded(
                  child: new TextField(
                autofocus: true,
                decoration: new InputDecoration(
                    errorText:
                        _invalidCode ? "Please Enter A Valid Referral." : null,
                    labelText: 'Code',
                    hintText: 'eg. XYZ123'),
                onChanged: (value) {
                  pCode = value;
                },
              ))
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            RaisedButton(
              color: MaterialColors.mpurple1,
              child: Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                if (pCode.toString().isEmpty) {
                  setState(() {
                    _invalidCode = true;
                  });
                } else {
                  List powerCodes = Market.powerCode;
                  powerCodes.forEach((code) {
                    if (pCode.toString().toLowerCase() ==
                        code.toString().toLowerCase()) {
                      Market.hasPowerCode = true;
                      print("Here");
                      setState(() {
                        Market.boughtPowerCard2 += 1;
                       // Market.availPowerCard2 -= 1;
                        hasPCode = true;
                        Navigator.of(context).pop(pCode);
                      });
                    } else {
                      setState(() {
                        _invalidCode = true;
                      });
                    }
                  });
                }
              },
            ),
          ],
        );
      },
    );
  }
}
