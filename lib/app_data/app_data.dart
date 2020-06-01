import 'dart:async';

import 'package:vsm/model/profile.dart';
import 'package:vsm/model/market.dart';
import 'package:vsm/model/trial.dart';

class AppData {
  static List<Profile> profiles = [
    new Profile(
      title: "BILL G.",
      imageUrl: "assets/images/Bill_Gates.jpg",
      quantity: Market.stocks[0].toString(),
      sellingPrice: Market.sellingPrice[0][inRound].toString(),
    ),
    Profile(
      title: "JEFF B.",
      imageUrl: "assets/images/Jeff_Bezos.jpg",
      quantity: Market.stocks[1].toString(),
      sellingPrice: Market.sellingPrice[1][inRound].toString(),
    ),
    Profile(
      title: "ELON M.",
      imageUrl: "assets/images/Elon_Musk.jpg",
      quantity: Market.stocks[2].toString(),
      sellingPrice: Market.sellingPrice[2][inRound].toString(),
    ),
    Profile(
      title: "MARK Z.",
      imageUrl: "assets/images/Mark_Zuckerberg.jpg",
      quantity: Market.stocks[3].toString(),
      sellingPrice: Market.sellingPrice[3][inRound].toString(),
    ),
    Profile(
      title: "MUKESH A.",
      imageUrl: "assets/images/Mukesh_Ambani.jpg",
      quantity: Market.stocks[4].toString(),
      sellingPrice: Market.sellingPrice[4][inRound].toString(),
    ),
  ];

  static List<Market> stocks = [
    Market(
      title: "Bill Gates",
      subtitle: Market.sellingPrice[0][inRound].toString(),
      imageUrl: "assets/images/Bill_Gates.jpg",
    ),
    Market(
      title: "Jeff Bezos",
      subtitle: Market.sellingPrice[1][inRound].toString(),
      imageUrl: "assets/images/Jeff_Bezos.jpg",
    ),
    Market(
      title: "Elon Musk",
      subtitle: Market.sellingPrice[2][inRound].toString(),
      imageUrl: "assets/images/Elon_Musk.jpg",
    ),
    Market(
      title: "Mark Zuckerburg",
      subtitle: Market.sellingPrice[3][inRound].toString(),
      imageUrl: "assets/images/Mark_Zuckerberg.jpg",
    ),
    Market(
      title: "Mukesh Ambani",
      subtitle: Market.sellingPrice[4][inRound].toString(),
      imageUrl: "assets/images/Mukesh_Ambani.jpg",
    )
  ];
   static List<Market> trialStocks = [
    Market(
      title: "Oculus",
      subtitle: Trial.sellingPrice[0][inRound].toString(),
      imageUrl: "assets/images/oculus.jpg",
    ),
    Market(
      title: "Company X",
      subtitle: Trial.sellingPrice[1][inRound].toString(),
      imageUrl: "assets/images/oculus.jpg",
    ),
    Market(
      title: "Company Y",
      subtitle: Trial.sellingPrice[2][inRound].toString(),
      imageUrl: "assets/images/oculus.jpg",
    ),
 
  ];

  static var sponsorImages = ['assets/images/oculus.jpg', 'assets/images/oculus.jpg', 'assets/images/oculus.jpg', 'assets/images/oculus.jpg', 'assets/images/oculus.jpg'];
  static var sponsorCodes = ['jpcntm', 'qkvzwd', 'jghkas', 'acxrts', 'nfdkcj'];
  // Round 2nd Sponsor codes = ['ixqsuk', 'isduqv', 'bhayip', 'uxyafq', 'edkpbf'];
  static var prevNetWorth = 0;
  static int currentRound = -1;
  static int countTimer = 10;
  static int inRound = 0;
  static int trialRound = -1;
}