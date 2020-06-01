import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vsm/model/market.dart';

import 'MaterialColors.dart';

class PowerCard extends StatefulWidget {
  final int idval;
  final bool front;
  final String text, desc;
  Color colr;
  PowerCard(this.text, this.desc, this.idval, this.front,
      {this.colr = MaterialColors.mpurple1});
  //PowerCard(this.text);

  @override
  State<StatefulWidget> createState() {
    return PowerCardState();
  }
}

class PowerCardState extends State<PowerCard> {
  int _counter1 = 0, _counter2 = 0;
  bool reset = false, beforeRound1 = Market.allowPowerCards;
  bool _value1 = false;
  @override
  void initState() {
    super.initState();
    new Timer.periodic(
        Duration(seconds: 1),
        (Timer t) => setState(() {
              if (this.mounted) {
                reset = Market.counterResetPower;
                if (reset) {
                  _counter1 = 0;
                  _counter2 = 0;
                }
              }
            }));
  }

  @override
  Widget build(BuildContext context) {
    if (widget.front) {
      String _image;
      if (widget.idval == 1) {
        _image = "assets/images/gis.png";
      } else {
        _image = "assets/images/bf.png";
      }
      return Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 85.0,
              width: 150.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: new DecorationImage(
                      fit: BoxFit.fill, image: new AssetImage(_image))),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
        decoration: new BoxDecoration(
            color: widget.colr,
            shape: BoxShape.rectangle,
            borderRadius: new BorderRadius.circular(2.0),
            boxShadow: <BoxShadow>[
              new BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  offset: new Offset(5.0, 10.0))
            ]),
      );
    } else {
      return Container(
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  widget.text,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )),
            Padding(
                padding: EdgeInsets.only(top: 10, right: 5, left: 5),
                child: Text(
                  widget.desc,
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                )),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ButtonBar(
                    children: <Widget>[
                      SizedBox(
                        width: 40,
                        height: 30,
                        child: RaisedButton(
                          color: Colors.white,
                          child: Icon(Icons.remove,
                              color: MaterialColors.mpurple1),
                          onPressed: beforeRound1
                              ? () {
                                  setState(() {
                                    if (widget.idval == 1) {
                                      if (_counter1 > 0 &&
                                          Market.powerCard1 > 0) {
                                        _counter1 -= 1;
                                        Market.powerCard1 = _counter1;
                                      }
                                    } else {
                                      if (_counter2 > 0 &&
                                          Market.powerCard2 > 0) {
                                        _counter2 -= 1;
                                        Market.powerCard2 = _counter2;
                                      }
                                    }
                                  });
                                }
                              : null,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(right: 5, left: 5),
                          child: Text(
                            widget.idval == 1
                                ? _counter1.toString()
                                : _counter2.toString(),
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          )),
                      SizedBox(
                        width: 40,
                        height: 30,
                        child: RaisedButton(
                          color: Colors.white,
                          child:
                              Icon(Icons.add, color: MaterialColors.mpurple1),
                          onPressed: beforeRound1
                              ? () {
                                  setState(() {
                                    if (widget.idval == 1) {
                                      if (_counter1 <= 0 &&
                                          Market.availPowerCard1 > 0) {
                                        Market.counterResetPower = false;
                                        _counter1 += 1;
                                        Market.powerCard1 = _counter1;
                                        print("Power Card 1 : " +
                                            Market.powerCard1.toString());
                                      }
                                    } else {
                                      if ((_counter2 <= 1 &&
                                              Market.availPowerCard2 > 1) ||
                                          (_counter2 <= 0 &&
                                              Market.availPowerCard2 > 0)) {
                                        Market.counterResetPower = false;
                                        print(
                                            "Before :" + _counter2.toString());
                                        _counter2 += 1;
                                        print("After :" + _counter2.toString());
                                        Market.powerCard2 = _counter2;
                                        print("Market :" +
                                            Market.powerCard2.toString());

                                        print("Power Card 2 : " +
                                            Market.powerCard2.toString());
                                      }
                                    }
                                  });
                                }
                              : null,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        decoration: new BoxDecoration(
            color: widget.colr,
            shape: BoxShape.rectangle,
            borderRadius: new BorderRadius.circular(2.0),
            boxShadow: <BoxShadow>[
              new BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  offset: new Offset(5.0, 10.0))
            ]),
      );
    }
  }
}
