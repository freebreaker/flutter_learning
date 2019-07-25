import "package:flutter/material.dart";

class CardEveryday extends StatefulWidget {
  CardEveryday({Key key,this.title,this.author}):super(key:key);

  final String title;
  final String author;

  @override 
  _CardEveryday createState()=>_CardEveryday();
}

class _CardEveryday extends State<CardEveryday>{
  @override 
  Widget build(BuildContext context){
    return Text("123");
  }
}