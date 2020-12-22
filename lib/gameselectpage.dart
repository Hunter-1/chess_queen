import 'package:chess_queen/Model/text.dart';
import 'package:flutter/material.dart';

class GameSelectPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Spiel wählen")),
        body: Column(
            children: <Widget>[
              Container(alignment: Alignment.center,
                child: CustomText(text: "8 Turm Problem"),),
              IconButton(icon: Image.asset("assets/images/rook.png"),
                  iconSize: 200,
                  onPressed: () {Navigator.pushNamed(context,"/gamerook" );}),
              Container(alignment: Alignment.center,
                child: CustomText(text: "8 Damen Problem"),),
              IconButton(icon: Image.asset("assets/images/queen.png"),
                  iconSize: 200,
                  onPressed: () {Navigator.pushNamed(context,"/gamequeen" );})
            ]
        )
    );
  }
}