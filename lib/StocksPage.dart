import 'package:flutter/material.dart';
import 'package:vsm/HomePageBody.dart';

class StockPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.only(bottom: 16.0),
      color: Colors.white,
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          new InkWell(
            child: HomePageBody("assets/images/Bill_Gates.jpg", "BILL GATES",
                "An American business magnate, software developer, investor and philanthropist. He is best known as the co-founder of Microsoft Corporation."),
            onTap: () {
              print("Hello1");
            },
          ),
          new InkWell(
            child: HomePageBody("assets/images/Elon_Musk.jpg", "ELON MUSK",
                "An South African-born American, engineer and technology entrepreneur.He is the founder, CEO, and chief engineer/designer of SpaceX, CEO and product architect of Tesla, Inc."),
            onTap: () {
              print("Hello2");
            },
          ),
          new InkWell(
            child: HomePageBody("assets/images/Jeff_Bezos.jpg", "JEFF BEZOS",
                "An American internet & aerospace entrepreneur, media proprietor and investor. He is best known as the founder, CEO and President of Amazon Inc."),
            onTap: () {
              print("Hello3");
            },
          ),
          new InkWell(
            child: HomePageBody(
                "assets/images/Mark_Zuckerberg.jpg",
                "M. ZUCKERBERG",
                "An American internet entrepreneur & philanthropist. He is known for co-founding and leading Facebook Inc. He has also co-founded the solar sail spacecraft development project."),
            onTap: () {
              print("Hello4");
            },
          ),
          new InkWell(
            child: HomePageBody(
                "assets/images/Mukesh_Ambani.jpg",
                "MUKESH AMBANI",
                "An Indian business magnate, and the chairman, managing director, and the largest shareholder of Reliance Industries Ltd."),
            onTap: () {
              print("Hello5");
            },
          ),
        ],
      ),
    );
  }
}
