import 'package:chess_queen/Model/text.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget{
  @override
  RegisterPageState createState() => new RegisterPageState();
}

class RegisterPageState extends State<RegisterPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Registrieren")),
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
              Container (
                margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Passwort bestätigen"
                  ),
                ),
              ),
              CustomButton(text: "Registrieren", onPressed: () {Navigator.pushNamed(context,"/user" );}),
            ]
        )
    );
  }
}