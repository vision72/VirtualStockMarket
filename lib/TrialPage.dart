import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vsm/model/market.dart';
import 'package:vsm/app_data/app_data.dart';
import 'MaterialColors.dart';
import 'UserSlab.dart';

import 'database_helper.dart';
import 'model/market.dart';
import 'model/market.dart';
import 'model/trial.dart';

class TrialPage extends StatefulWidget {
  @override
  _TrialPageState createState() => _TrialPageState();
}

class _TrialPageState extends State<TrialPage> {
  bool _isRoundButton = Trial.isButtonDisabled;
  DatabaseHelper db = DatabaseHelper();
  int counter = 10;
  // Future<Map<String, dynamic>> getTeamMap() async {
  //   return db.getTeamMap();
  // }

  @override
  void initState() {
    super.initState();
    //AppData.trialRound++;

    if (Trial.isButtonDisabled == false) {
      setState(() {
        Trial.timerStarted = true;
      });

      new Timer.periodic(
          Duration(seconds: 1),
          (Timer t) => setState(() {
                counter--;
              }));
      new Timer.periodic(
          Duration(seconds: 10),
          (Timer t) => setState(() {
                _isRoundButton = true;
                Trial.isButtonDisabled = true;
                Trial.timerStarted = false;
                t.cancel();
                // Future<int> result =
                //     db.insertRound(AppData.trialRound + 1, Trial.stocks);
                // print(Future.value(result));
                // db.insertRound(AppData.trialRound + 1, Trial.stocks);
                for (int j = 0; j < 3; j++) {
                  int sum1 = 0;
                  for (int i = 0; i < AppData.trialRound + 1; i++) {
                    sum1 += Trial.setStocks[j][i];
                  }
                  Trial.setStocks[j][AppData.trialRound + 1] =
                      Trial.stocks[j] - sum1;
                }

                print(Trial.setStocks);
                Navigator.pushReplacementNamed(context, '/trialSlab');
              }));
    }
  }

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(
    //   builder: (BuildContext context, AsyncSnapshot snapshot) {
    //     if (snapshot.connectionState == ConnectionState.none ||
    //         snapshot.connectionState == ConnectionState.waiting ||
    //         snapshot.hasData == null)
    //       return Container();
    //     else {
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
                  "Cash : " + Trial.userMoney.toString(),
                  style: TextStyle(fontSize: 18),
                ),
              ))
        ],
        backgroundColor: MaterialColors.mpurple1,
      ),
      body: Container(
          child: ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, index) {
          return Container(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Image(
                      image: AssetImage(AppData.trialStocks[index].imageUrl),
                    ),
                    title: Text(AppData.trialStocks[index].title),
                    subtitle: Text("Price: " +
                        Trial.sellingPrice[index][AppData.trialRound + 1]
                            .toString() +
                        "\nQuantity: " +
                        Trial.stocks[index].toString()),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: Icon(Icons.add, color: Colors.green[800]),
                        onPressed: () {
                          Trial.isButtonDisabled
                              ? null
                              : setState(() {
                                  if (Trial.currentstock[index] > 0 &&
                                      Trial.userMoney > 0 &&
                                      Trial.userMoney -
                                              Trial.sellingPrice[index]
                                                  [AppData.trialRound + 1] >=
                                          0) {
                                    Trial.currentstock[index] -= 1;
                                    Trial.stocks[index] += 1;
                                    Trial.userMoney -= Trial.sellingPrice[index]
                                        [AppData.trialRound + 1];
                                    print(Trial.userMoney);
                                    print(Trial.currentstock);
                                    Trial.setStocks[index]
                                        [AppData.trialRound + 1] += 1;
                                  }
                                });
                        },
                      ),
                      Text(
                        Trial.stocks[index].toString(),
                        textWidthBasis: TextWidthBasis.longestLine,
                      ),
                      FlatButton(
                        child: Icon(Icons.remove, color: Colors.deepOrange),
                        onPressed: () {
                          Trial.isButtonDisabled
                              ? null
                              : setState(() {
                                  if (Trial.stocks[index] != 0) {
                                    Trial.currentstock[index] += 1;
                                    Trial.stocks[index] -= 1;
                                    Trial.userMoney += Trial.sellingPrice[index]
                                        [AppData.trialRound + 1];
                                    Trial.sold += 1;
                                    print(Trial.userMoney);
                                    print(Trial.currentstock);
                                    Trial.setStocks[index]
                                        [AppData.trialRound + 1] -= 1;
                                  }
                                });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      )),
      floatingActionButton: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10.0, bottom: 90.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: FloatingActionButton.extended(
                heroTag: null,
                // heroTag: "btn2",
                onPressed: _isRoundButton
                    ? () {
                        setState(() {
                          Trial.isButtonDisabled = !Trial.isButtonDisabled;
                        });
                        Navigator.pushReplacementNamed(
                            context, '/trialSponsor');
                      }
                    : null,
                label: Text(counter.toString()),
                icon: Icon(Icons.navigate_next),
                elevation: 10.0,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * .37, bottom: MediaQuery.of(context).size.height * .13 ),
            alignment: Alignment.bottomRight,
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton.extended(
                heroTag: null,
                // heroTag: "btn1",
                icon: Icon(Icons.navigate_before),
                label: Text("Exit"),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/trail');
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
    // }
    // },
    //future: getTeamMap(),
    // );
  }
}
