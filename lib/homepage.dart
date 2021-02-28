import 'package:chess_queen/loginpage.dart';
import 'package:flutter/material.dart';
import 'Model/text.dart';
import 'package:chess_queen/main.dart';



class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        Container(child: new Image.asset("assets/images/queen.png"),
          margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
        ),
        Container(
          child: Text("8 Damen Problem",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),),
          margin: EdgeInsets.fromLTRB(0, 10, 0, 151),
        ),
        CustomButton(text: "Anmelden",
            onPressed: () {Navigator.pushNamed(context,LoginPage().routename );}),
        CustomButton(text: "Einstellungen",
            onPressed:() {Navigator.pushNamed(context,SettingsPage().routename );})
      ]
      ),
    );
  }
}