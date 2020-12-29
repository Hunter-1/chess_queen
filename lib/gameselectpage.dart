import 'package:chess_queen/Model/text.dart';
import 'package:flutter/material.dart';
import 'Model/user.dart';
import 'gamepage.dart';

class GameSelectPage extends StatelessWidget{
  String routename = "/gameselect";
  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(title: Text("Spiel wählen")),
        body: Column(
            children: <Widget>[
              Container(alignment: Alignment.center,
                child: CustomText(text: "8 Turm Problem"),),
              IconButton(icon: Image.asset("assets/images/rook.png"),
                  iconSize: 200,
                  onPressed: () {Navigator.pushNamed(context,GamePage(false).routerook, arguments: user);}),
              Container(alignment: Alignment.center,
                child: CustomText(text: "8 Damen Problem"),),
              IconButton(icon: Image.asset("assets/images/queen.png"),
                  iconSize: 200,
                  onPressed: () {Navigator.pushNamed(context,GamePage(true).routequeen, arguments: user);})
            ]
        )
    );
  }
}