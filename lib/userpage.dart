import 'package:chess_queen/Model/text.dart';
import 'package:flutter/material.dart';
import 'Model/user.dart';

class UserPage extends StatefulWidget{
  @override
  UserPageState createState() => new UserPageState();
}

class UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(title: Text("Profil")),
        body: Column(
            children: <Widget>[
              Container(alignment: Alignment.center,
                child: CustomText(text: user.username)),
              CustomButton(text: "Start Game", onPressed: () {Navigator.pushNamed(context,"/gameselect", arguments: user);}),
              CustomButton(text: "Resultate", onPressed: () {Navigator.pushNamed(context,"/results");}),
              CustomButton(text: "Abmelden", onPressed: () {Navigator.pushNamed(context,"/" );})
            ]
        )
    );
  }
}