import 'package:flutter/material.dart';
import 'Model/text.dart';



class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("8 Damen Problem")),
      body: Column(children: <Widget>[
        new Image.asset("assets/images/queen.png"),
        CustomButton(text: "Anmelden",
            onPressed: () {Navigator.pushNamed(context,"/login" );}),
        CustomButton(text: "Einstellungen",
            onPressed:() {Navigator.pushNamed(context,"/settings" );})
      ]
      ),
    );
  }
}