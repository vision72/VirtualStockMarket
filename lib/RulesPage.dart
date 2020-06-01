import 'package:flutter/material.dart';
import 'package:vsm/CardItemModel.dart';

class RulesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  var appColors = [
    Color.fromRGBO(231, 129, 109, 1.0),
    Color.fromRGBO(99, 138, 223, 1.0),
    Color.fromRGBO(111, 194, 173, 1.0),
    Colors.pinkAccent.shade100
  ];
  var cardIndex = 0;
  ScrollController scrollController;
  var currentColor = Color.fromRGBO(231, 129, 109, 1.0);

  static String rule1 =
      "1. The storyline is entirely work of fiction. Names, characters, businesses, places, events, locales and incidents are used in a fictitious manner.\n2. A trail round will be held before the main game starts to familiarize everyone with the app & its working.\n3. A set amount of virtual money shall be given at the start of the event. This will be used to buy and sell stocks.";

  static String rule2 =
      "4. The game consists of 5 rounds.One can buy and sell stocks at the end of each round.\n5. A secret code will be given to you, and after entering the code the market place will be open for 45 seconds.\n6. You will be allowed to purchase a particular stock only 15 times in one round.";

  static String rule3 =
      "7. There will be no limit on selling the stocks.\n8. All your purchases and current stock holdings will be reflected in the \"Portfolio\" tab.\n9. Basic information about all the stocks will be provided at all times.";

  static String rule4 =
      "10. Power Cards if needed have to be purchased at the start of the game. Detailed information of the usage of the power cards is given in the \"Powercard\" tab.\n11. Make sure that you get your doubts cleared about the working of the app before the game starts, so as to ensure that you enjoy to the fullest.";

  var cardsList = [
    CardItemModel("Rules 1 - 3", Icons.account_circle, 9, 0.25, rule1),
    CardItemModel("Rules 4 - 6", Icons.work, 12, 0.5, rule2),
    CardItemModel("Rules 7 - 9", Icons.home, 7, 0.75, rule3),
    CardItemModel("Rules 10 - 11", Icons.access_time, 7, 1, rule4)
  ];

  AnimationController animationController;
  ColorTween colorTween;
  CurvedAnimation curvedAnimation;

  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController();
  }

  @override
  Widget build(BuildContext context) {

    dynamic deviceHeight = MediaQuery.of(context).size.height;
    dynamic deviceWidth = MediaQuery.of(context).size.width;

    return new Scaffold(
      backgroundColor: currentColor,
      // appBar: new AppBar(
      //   // title: new Text(
      //   //   "RULES",
      //   //   style: TextStyle(fontSize: 16.0),
      //   // ),
      //   backgroundColor: currentColor,
      //   centerTitle: true,
      //   actions: <Widget>[
      //     Padding(
      //       padding: const EdgeInsets.only(right: 16.0),
      //     ),
      //   ],
      //   elevation: 0.0,
      // ),
      body: new Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(),
            Padding(
              padding: EdgeInsets.only(left: deviceWidth * .05),
              // const EdgeInsets.symmetric(horizontal: 64.0, vertical: 2.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 12.0),
                      child: Text(
                        "List of Rules",
                        style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 450.0,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    controller: scrollController,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, position) {
                      return GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: Container(
                              width: 250.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Icon(
                                          cardsList[position].icon,
                                          color: appColors[position],
                                        ),
                                      ],
                                    ),
                                  ),
                                  new Padding(
                                    padding: EdgeInsets.all(10),
                                    child: new Text(cardsList[position].rules),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0, vertical: 4.0),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0, vertical: 4.0),
                                          child: Text(
                                            "${cardsList[position].cardTitle}",
                                            style: TextStyle(fontSize: 28.0),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: LinearProgressIndicator(
                                            value: cardsList[position]
                                                .taskCompletion,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                        ),
                        onHorizontalDragEnd: (details) {
                          animationController = AnimationController(
                              vsync: this,
                              duration: Duration(milliseconds: 500));
                          curvedAnimation = CurvedAnimation(
                              parent: animationController,
                              curve: Curves.fastOutSlowIn);
                          animationController.addListener(() {
                            setState(() {
                              currentColor =
                                  colorTween.evaluate(curvedAnimation);
                            });
                          });

                          if (details.velocity.pixelsPerSecond.dx > 0) {
                            if (cardIndex > 0) {
                              cardIndex--;
                              colorTween = ColorTween(
                                  begin: currentColor,
                                  end: appColors[cardIndex]);
                            }
                          } else {
                            if (cardIndex < 3) {
                              cardIndex++;
                              colorTween = ColorTween(
                                  begin: currentColor,
                                  end: appColors[cardIndex]);
                            }
                          }
                          setState(() {
                            scrollController.animateTo((cardIndex) * 256.0,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.fastOutSlowIn);
                          });

                          colorTween.animate(curvedAnimation);

                          animationController.forward();
                        },
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
