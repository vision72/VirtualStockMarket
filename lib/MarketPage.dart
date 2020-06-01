import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vsm/model/market.dart';
import 'package:vsm/app_data/app_data.dart';
import 'UserSlab.dart';

import 'database_helper.dart';
import 'model/market.dart';
import 'model/market.dart';

class MarketPage extends StatefulWidget {
  @override
  _MarketPageState createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  bool _isRoundButton = Market.isButtonDisabled;
  DatabaseHelper db = DatabaseHelper();
  int counter = 10;
  // Future<Map<String, dynamic>> getTeamMap() async {
  //   return db.getTeamMap();
  // }

  @override
  void initState() {
    super.initState();
    //AppData.currentRound++;
    setState(() {
      if (AppData.currentRound == 4) {
                        _isRoundButton=false;
                        Market.timerStarted=true;
                      }
    });
     
    if (Market.isButtonDisabled == false) {
      setState(() {
        Market.timerStarted = true;
        
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
                Market.isButtonDisabled = true;
                Market.timerStarted = false;
                t.cancel();
                // Future<int> result =
                //     db.insertRound(AppData.currentRound + 1, Market.stocks);
                // print(Future.value(result));
                db.insertRound(AppData.currentRound + 1, Market.stocks);
                for (int j = 0; j < 5; j++) {
                  int sum1 = 0;
                  for (int i = 0; i < AppData.currentRound + 1; i++) {
                    sum1 += Market.setStocks[j][i];
                  }
                  Market.setStocks[j][AppData.currentRound + 1] =
                      Market.stocks[j] - sum1;
                }

                print(Market.setStocks);
                Navigator.pushReplacementNamed(context, '/slab');
              }));
    }
  }

  @override
  Widget build(BuildContext context) {
    if(Market.powerCard1Active){
      for(int i=0;i<5;i++){
       Market.sellingPrice[i][AppData.currentRound + 1] = (Market.sellingPrice[i][AppData.currentRound + 1]*0.9).round(); 
      }
      Market.powerCard1Active = false;
    }
    // return FutureBuilder(
    //   builder: (BuildContext context, AsyncSnapshot snapshot) {
    //     if (snapshot.connectionState == ConnectionState.none ||
    //         snapshot.connectionState == ConnectionState.waiting ||
    //         snapshot.hasData == null)
    //       return Container();
    //     else {
    return Scaffold(
      body: Container(
          child: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, index) {
          return Container(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Image(
                      image: AssetImage(AppData.stocks[index].imageUrl),
                    ),
                    title: Text(AppData.stocks[index].title),
                    subtitle: Text("Price: " +
                        Market.sellingPrice[index][AppData.currentRound + 1]
                            .toString() +
                        "\nQuantity: " +
                        Market.stocks[index].toString()),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: Icon(Icons.add, color: Colors.green[800]),
                        onPressed: () {
                          Market.isButtonDisabled
                              ? null
                              : setState(() {
                                  if (Market.currentstock[index] > 0 &&
                                      Market.userMoney > 0 && Market.userMoney-Market.sellingPrice[index][AppData.currentRound + 1] >=0) {
                                    Market.currentstock[index] -= 1;
                                    Market.stocks[index] += 1;
                                    Market.userMoney -=
                                        Market.sellingPrice[index][AppData.currentRound + 1];
                                    print(Market.userMoney);
                                    print(Market.currentstock);
                                    Market.setStocks[index]
                                        [AppData.currentRound + 1] += 1;
                                  }
                                });
                        },
                      ),
                      Text(
                        Market.stocks[index].toString(),
                        textWidthBasis: TextWidthBasis.longestLine,
                      ),
                      FlatButton(
                        child: Icon(Icons.remove, color: Colors.deepOrange),
                        onPressed: () {
                          Market.isButtonDisabled
                              ? null
                              : setState(() {
                                  if (Market.stocks[index] != 0) {
                                    Market.currentstock[index] += 1;
                                    Market.stocks[index] -= 1;
                                    Market.userMoney +=
                                        Market.sellingPrice[index]
                                            [AppData.currentRound + 1];
                                    Market.sold += 1;
                                    print(Market.userMoney);
                                    print(Market.currentstock);
                                    Market.setStocks[index]
                                        [AppData.currentRound + 1] -= 1;
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
      floatingActionButton: Container(
        padding: EdgeInsets.only(left: 10.0, bottom: 90.0),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: FloatingActionButton.extended(
            onPressed: _isRoundButton
                ? () {
                    setState(() {
                     

                      Market.isButtonDisabled = !Market.isButtonDisabled;
                    });
                    Navigator.pushReplacementNamed(context, '/sponsor');
                  }
                : null,
            label: Text(counter.toString()),
            icon: Icon(Icons.navigate_next),
            elevation: 10.0,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
    // }
    // },
    //future: getTeamMap(),
    // );
  }
}
