import 'package:flutter/material.dart';

import 'MaterialColors.dart';

class CardRow extends StatelessWidget {
  
  final String _imagel,name,description;
  final Color c= MaterialColors.mblue;
  CardRow(this._imagel,this.name,this.description);
  
  @override
  Widget build(BuildContext context){
    
  final cardThumbnail = new Container(
    margin: new EdgeInsets.symmetric(
      vertical: 27.0
    ),
    alignment: FractionalOffset.centerLeft,
    child: new Container(
      height: 92.0,
      width: 92.0,
      decoration: new BoxDecoration(

      shape: BoxShape.circle,
      image: new DecorationImage(
        fit: BoxFit.fill,
        image: new AssetImage(_imagel))
    ),),
  );
  final cardType= new Container(
    width: double.infinity,
    height: 150.0,
    margin: new EdgeInsets.only(left: 45.0),
    decoration: new BoxDecoration(
      color: c,
      shape: BoxShape.rectangle,
      borderRadius: new BorderRadius.circular(8.0),
      boxShadow: <BoxShadow>[
        new BoxShadow(
          color: Colors.black12,
          blurRadius: 10.0,
          offset: new Offset(0.0, 10.0)

        )
      ]
    ),
    child: Column(children: <Widget>[Padding(padding: EdgeInsets.only(top: 5),child:Text(name,style: TextStyle(fontSize: 18,color: Colors.white,shadows: <Shadow>[
      Shadow(
        offset: Offset(0.0, 2.0),
        blurRadius: 3.0,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
     
    ],),textAlign: TextAlign.center,),),
      Container(child: Padding(padding: EdgeInsets.only(left: 60,top:10,bottom: 5,right: 20),child: Text(description,textAlign: TextAlign.justify,style: TextStyle(fontSize: 12.5,color: Colors.white,),),),)
    ]));
    
     return  Container(
     
      margin: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 20.0,
      ),
      child: new Stack(
        children: <Widget>[
          cardType,
          cardThumbnail,
        ],
      ),
    ) ;
  }

}