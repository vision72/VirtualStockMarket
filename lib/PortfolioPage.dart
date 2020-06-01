import 'dart:math';
import 'package:flutter/material.dart';
import 'package:vsm/TeamModel.dart';
import 'package:vsm/app_data/app_data.dart';
import 'package:vsm/database_helper.dart';
import 'package:vsm/model/market.dart';
import 'package:vsm/model/profile.dart';
import 'database_helper.dart';

class ProfilePageState extends State<ProfilePage> {
  Profile profile;
  int cround = AppData.currentRound + 1;

  DatabaseHelper db = DatabaseHelper();

  Future<Map<String, dynamic>> getRoundMapTotal() async {
    return db.getRoundMapTotal();
  }

  @override
  void initState() {
    var random = Random();
    profile = AppData.profiles[random.nextInt(5)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.none ||
            snapshot.connectionState == ConnectionState.waiting ||
            snapshot.hasData == null)
          return Container(
            child: Text(""),
          );
        else {
          print("asdfgh");
          print(snapshot.data);

          if (snapshot.data == null) {
            return Scaffold(
              body: ListView(
                children: <Widget>[
                  AnimatedSwitcher(
                    duration: Duration(
                      milliseconds: 0,
                    ),
                    // transitionBuilder: (Widget child, Animation<double> animation) => SlideTransition(
                    //   child: child,
                    //   position: Tween<Offset>(begin: Offset(0.0, 0.7), end: Offset(0.0, 0.0)).animate(animation),
                    // ),
                    child: HeaderSection(
                      profile: profile,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10.0,
                            offset: new Offset(5.0, 10.0))
                      ],
                    ),
                    child: Wrap(
                      children: <Widget>[
                        for (int i = 0; i < AppData.profiles.length; i++)
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                profile = AppData.profiles[i];
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  right: 4.0, top: 10.0, left: 11.5),
                              height: MediaQuery.of(context).size.width / 3.5,
                              width: MediaQuery.of(context).size.width / 3.5,
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.all(Radius.circular(100.0)),
                                image: DecorationImage(
                                    image: AssetImage(
                                        AppData.profiles[i].imageUrl),
                                    fit: BoxFit.cover),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black38,
                                      blurRadius: 10.0,
                                      offset: new Offset(5.0, 10.0))
                                ],
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 10, bottom: 40),
                      child: DataTable(columnSpacing: 1, columns: [
                        DataColumn(label: Text('Stock')),
                        DataColumn(label: Text('Total Cost')),
                        DataColumn(label: Text('Per Stock')),
                      ], rows: [
                        DataRow(cells: [
                          DataCell(Text('Bill G.')),
                          DataCell(Text((0).toString())),
                          DataCell(
                              Text(Market.sellingPrice[0][cround].toString())),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Jeff B.')),
                          DataCell(Text(0.toString())),
                          DataCell(
                              Text(Market.sellingPrice[1][cround].toString())),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Elon M.')),
                          DataCell(Text(0.toString())),
                          DataCell(
                              Text(Market.sellingPrice[2][cround].toString())),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Mark Z.')),
                          DataCell(Text(0.toString())),
                          DataCell(
                              Text(Market.sellingPrice[3][cround].toString())),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Mukesh P.')),
                          DataCell(Text(0.toString())),
                          DataCell(
                              Text(Market.sellingPrice[4][cround].toString())),
                        ]),
                      ])),
                ],
              ),
            );
          }
          Market.stocks[0] = snapshot.data["sum(stock1)"];
          Market.stocks[1] = snapshot.data["sum(stock2)"];
          Market.stocks[2] = snapshot.data["sum(stock3)"];
          Market.stocks[3] = snapshot.data["sum(stock4)"];
          Market.stocks[4] = snapshot.data["sum(stock5)"];
          return Scaffold(
            body: ListView(
              children: <Widget>[
                AnimatedSwitcher(
                  duration: Duration(
                    milliseconds: 0,
                  ),
                  // transitionBuilder: (Widget child, Animation<double> animation) => SlideTransition(
                  //   child: child,
                  //   position: Tween<Offset>(begin: Offset(0.0, 0.7), end: Offset(0.0, 0.0)).animate(animation),
                  // ),
                  child: HeaderSection(
                    profile: profile,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10.0,
                          offset: new Offset(5.0, 10.0))
                    ],
                  ),
                  child: Wrap(
                    children: <Widget>[
                      for (int i = 0; i < AppData.profiles.length; i++)
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (i == 0) {
                                Market.stocks[0] = snapshot.data["sum(stock1)"];
                                AppData.profiles[0]
                                    .setQ(snapshot.data["sum(stock1)"]);
                                profile = AppData.profiles[i];
                              }
                              if (i == 1) {
                                Market.stocks[1] = snapshot.data["sum(stock2)"];

                                AppData.profiles[1]
                                    .setQ(snapshot.data["sum(stock2)"]);
                                profile = AppData.profiles[i];
                              }
                              if (i == 2) {
                                Market.stocks[2] = snapshot.data["sum(stock3)"];

                                AppData.profiles[2]
                                    .setQ(snapshot.data["sum(stock3)"]);
                                profile = AppData.profiles[i];
                              }
                              if (i == 3) {
                                Market.stocks[3] = snapshot.data["sum(stock4)"];

                                AppData.profiles[3]
                                    .setQ(snapshot.data["sum(stock4)"]);
                                profile = AppData.profiles[i];
                              }
                              if (i == 4) {
                                Market.stocks[4] = snapshot.data["sum(stock5)"];

                                AppData.profiles[4]
                                    .setQ(snapshot.data["sum(stock5)"]);
                                profile = AppData.profiles[i];
                              }
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                right: 4.0, top: 10.0, left: 11.5),
                            height: MediaQuery.of(context).size.width / 3.5,
                            width: MediaQuery.of(context).size.width / 3.5,
                            decoration: BoxDecoration(
                              // borderRadius: BorderRadius.all(Radius.circular(100.0)),
                              image: DecorationImage(
                                  image:
                                      AssetImage(AppData.profiles[i].imageUrl),
                                  fit: BoxFit.cover),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black38,
                                    blurRadius: 10.0,
                                    offset: new Offset(5.0, 10.0))
                              ],
                            ),
                          ),
                        )
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 10, bottom: 40),
                    child: DataTable(columnSpacing: 1, columns: [
                      DataColumn(label: Text('Stock')),
                      DataColumn(label: Text('Total Cost')),
                      DataColumn(label: Text('Per Stock')),
                    ], rows: [
                      DataRow(cells: [
                        DataCell(Text('Bill G.')),
                        DataCell(Text((snapshot.data['sum(stock1)'] *
                                Market.sellingPrice[0][cround])
                            .toString())),
                        DataCell(
                            Text(Market.sellingPrice[0][cround].toString())),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Jeff B.')),
                        DataCell(Text((snapshot.data['sum(stock3)'] *
                                Market.sellingPrice[2][cround])
                            .toString())),
                        DataCell(
                            Text(Market.sellingPrice[1][cround].toString())),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Elon M.')),
                        DataCell(Text((snapshot.data['sum(stock2)'] *
                                Market.sellingPrice[1][cround])
                            .toString())),
                        DataCell(
                            Text(Market.sellingPrice[2][cround].toString())),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Mark Z.')),
                        DataCell(Text((snapshot.data['sum(stock4)'] *
                                Market.sellingPrice[3][cround])
                            .toString())),
                        DataCell(
                            Text(Market.sellingPrice[3][cround].toString())),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Mukesh P.')),
                        DataCell(Text((snapshot.data['sum(stock5)'] *
                                Market.sellingPrice[4][cround])
                            .toString())),
                        DataCell(
                            Text(Market.sellingPrice[4][cround].toString())),
                      ]),
                    ])),
              ],
            ),
          );
        }
      },
      future: getRoundMapTotal(),
    );
  }
}

class HeaderSection extends StatelessWidget {
  final Profile profile;

  HeaderSection({
    this.profile,
    Key key,
  }) : super(key: ValueKey<String>(profile.imageUrl));

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < AppData.profiles.length; i++)
      AppData.profiles[i].quantity = Market.stocks[i];
    for (int i = 0; i < AppData.profiles.length; i++)
      AppData.profiles[i].sellingPrice = Market.sellingPrice[i];
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Container(
            height: 110,
            width: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              image: DecorationImage(
                  image: AssetImage(profile.imageUrl), fit: BoxFit.cover),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38,
                    blurRadius: 10.0,
                    offset: new Offset(5.0, 10.0))
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            profile.title,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          // Text(AppData.profiles[2].stocksWithUser),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      profile.sellingPrice[AppData.currentRound + 1].toString(),
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text("Selling Price")
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(profile.quantity.toString(),
                        style: TextStyle(fontWeight: FontWeight.w600)),
                    Text("Quantity")
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  ProfilePageState createState() => ProfilePageState();
}
