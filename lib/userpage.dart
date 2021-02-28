import 'package:chess_queen/Model/text.dart';
import 'package:chess_queen/gameselectpage.dart';
import 'package:chess_queen/main.dart';
import 'package:chess_queen/resultspage.dart';
import 'package:flutter/material.dart';
import 'Model/user.dart';

class UserPage extends StatefulWidget{
  String routename = "/user";
  @override
  UserPageState createState() => new UserPageState();
}

class UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(title: Text("Profil", style: TextStyle(color: Colors.blueAccent),),
            automaticallyImplyLeading: false,
          iconTheme: IconThemeData(color: Colors.blueAccent),
          backgroundColor: Colors.transparent,
          elevation: 0,),

        body: Column(
            children: <Widget>[
              Container(alignment: Alignment.center,
                child: CustomText(text: user.username)),
              CustomButton(text: "Start Game", onPressed: () {Navigator.pushNamed(context,GameSelectPage().routename, arguments: user);}),
              CustomButton(text: "Resultate", onPressed: () {Navigator.pushNamed(context,ResultsPage().routename);}),
              CustomButton(text: "Abmelden", onPressed: () {Navigator.pushNamed(context,MyApp().routename );})
            ]
        )
    );
  }
}