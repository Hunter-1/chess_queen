import 'package:chess_queen/Model/text.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  @override
  LoginPageState createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Anmelden")),
          body: Column(
            children: <Widget>[
              Container (
                margin: const EdgeInsets.only(top: 10, bottom: 20, left: 10, right: 10),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Benutzername"
                  ),
                ),
              ),
              Container (
              margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Passwort"
                ),
              ),
            ),
              CustomButton(text: "Anmelden", onPressed: () {Navigator.pushNamed(context,"/user" );}),
              CustomButton(text: "Neuer Benutzer", onPressed: () {Navigator.pushNamed(context,"/register" );})
          ]
        )
    );
  }
}
//TODO Implement Login Logic