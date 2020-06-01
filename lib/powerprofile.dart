import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vsm/MaterialColors.dart';
import 'package:vsm/PowercardPage.dart';


import 'database_helper.dart';

class PowerProfile extends StatelessWidget {
  DatabaseHelper db = DatabaseHelper();

  Future<Map<String, dynamic>> getTeamMap() async {
    return db.getTeamMap();
  }

  @override
  Widget build(BuildContext context) {
    /// teamData = db.getTeamMap();
    return FutureBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.none ||
            snapshot.connectionState == ConnectionState.waiting ||
            snapshot.hasData == null)
          return Container();
        else {
          return Scaffold(
              body: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              // background image and bottom contents
              Container(
                color: Colors.black12,
                padding: EdgeInsets.only(top: 10, bottom: 20),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 50.0,
                      margin: EdgeInsets.only(top: 0, left: 10, right: 10),
                      color: MaterialColors.mpurple1,
                      child: Center(
                        child: Text(
                          "Team Name: " + snapshot.data["teamname"],
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                    Container(
                      height: 50.0,
                      margin: EdgeInsets.all(10),
                      color: MaterialColors.mpurple1,
                      child: Center(
                        child: Text(
                          "Team Code: " + snapshot.data["teamcode"],
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        padding: EdgeInsets.only(top: 100),
                        child: Center(
                          child: PowercardPage(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // Profile image
              Positioned(
                top: 150.0,
                // (background container size) - (circle height / 2)
                child: Container(
                  height: 70.0,
                  width: 70.0,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10.0,
                            offset: new Offset(5.0, 5.0))
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/icon/VSMLOGO.png"),
                          fit: BoxFit.cover)),
                ),
              )
            ],
          ));
        }
      },
      future: getTeamMap(),
    );
  }
}
