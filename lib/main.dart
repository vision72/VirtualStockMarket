import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:vsm/HomePage.dart';
import 'package:vsm/LoginPage.dart';
import 'package:vsm/MarketPage.dart';
import 'package:vsm/RulesPage.dart';
import 'package:vsm/SponsorPage.dart';

import 'package:vsm/PortfolioPage.dart';
import 'package:vsm/TrialPage.dart';
import 'package:vsm/trailRound.dart';
import 'package:vsm/trialSlab.dart';
import 'package:vsm/trialSponsor.dart';
import 'HomePage.dart';
import 'LoginPage.dart';
import 'UserSlab.dart';
import 'database_helper.dart';

void main() {
WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((_) {
     runApp(MyApp());
    });

} 

class MyApp extends StatelessWidget {
  DatabaseHelper db = DatabaseHelper();

  Future<bool> checkLoggedIn() async {
    return db.isLoggedIn();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.none ||
            snapshot.connectionState == ConnectionState.waiting ||
            snapshot.hasData == null)
          return MaterialApp(
            routes: {
              '/home': (context) => HomePage(),
              '/slab': (context) => UserSlab(),
              '/trail' : (context) => TrailRound(),
              '/trialSlab' : (context) => TrialSlab(),
              '/trialPage'  : (context) => TrialPage(),
              '/trialSponsor' : (context) =>TrialSponsorPage(),
              '/sponsor': (context) => SponsorPage(),
              '/portfolio' : (context) => ProfilePage(),
            
            },
            debugShowCheckedModeBanner: false,
            title: "VSM",
            home: new Scaffold(body: new Container()),
          );
        else {
          if (snapshot.data == true) {
            return MaterialApp(
              routes: {
                '/home': (context) => HomePage(),
                '/slab': (context) => UserSlab(),
                '/trail' : (context) => TrailRound(),
                '/trialSlab' : (context) => TrialSlab(),
                '/trialPage'  : (context) => TrialPage(),
                '/trialSponsor' : (context) =>TrialSponsorPage(),
                '/sponsor': (context) => SponsorPage(),
              
              },
              debugShowCheckedModeBanner: false,
              title: "VSM",
              home: Scaffold(body: TrailRound(),),
              // home: new Scaffold(body: TrailRound()),
            );
          } else {
            return MaterialApp(
              routes: {
                '/home': (context) => HomePage(),
                '/slab': (context) => UserSlab(),
                '/trail' : (context) => TrailRound(),
                '/trialSponsor' : (context) =>TrialSponsorPage(),
                '/trialSlab' : (context) => TrialSlab(),
                '/trialPage'  : (context) => TrialPage(),
                '/sponsor': (context) => SponsorPage(),
              },
              debugShowCheckedModeBanner: false,
              title: "VSM",
              home: new Scaffold(body: LoginPage()),
            );
          }
        }
      },
      future: checkLoggedIn(),
    );
  }
}
