import 'package:flutter/material.dart';
import 'package:vsm/CardRow.dart';

class HomePageBody extends StatelessWidget{
 final String _image,name,description;
HomePageBody(this._image, this.name,this.description);
  @override
  Widget build(BuildContext context){
    return new CardRow(_image,name,description);
  }
}