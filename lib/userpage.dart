import 'package:chess_queen/Model/text.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget{
  @override
  UserPageState createState() => new UserPageState();
}

class UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Profil")),
        body: Column(
            children: <Widget>[
              Container(alignment: Alignment.center,
                child: CustomText(text: "Benutzername"),),
              CustomText(text: "Klasse"),

              CustomButton(text: "Start Game", onPressed: () {Navigator.pushNamed(context,"/gameselect" );}),
              CustomButton(text: "Resultate", onPressed: () {Navigator.pushNamed(context,"/results");}),
              CustomButton(text: "Abmelden", onPressed: () {Navigator.pushNamed(context,"/" );})
            ]
        )
    );
  }
}
//TODO Implement UserPage Logic