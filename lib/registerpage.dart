import 'dart:convert';

import 'package:chess_queen/Model/text.dart';
import 'package:chess_queen/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:chess_queen/config.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget{
  String routename = "/register";
  @override
  RegisterPageState createState() => new RegisterPageState();
}

class RegisterPageState extends State<RegisterPage>{
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  String errortext1 = " ";
  String errortext2 = " ";

  @override
  void dispose() {
    userController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Registrieren")),
        body: Column(
            children: <Widget>[
              Container (
                margin: const EdgeInsets.only(top: 10, bottom: 20, left: 10, right: 10),
                child: TextField(
                  controller: userController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Benutzername"
                  ),
                ),
              ),
              Container (
                margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Passwort"
                  ),
                ),
              ),
              Container (
                margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
                child: TextField(
                  controller: passwordConfirmController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Passwort bestätigen"
                  ),
                ),
              ),
              CustomButton(text: "Registrieren", onPressed: () =>
                  createUserData(
                      userController.text, passwordController.text, passwordConfirmController.text
                  )),
              Text(errortext1),
              Text(errortext2)
            ]
        )
    );
  }
  createUserData(String username, String password, String confirmPassword) async {
    if (password == confirmPassword){
    var url = config.getUrl() + "users/";
    var body = jsonEncode({"name":username, "password":password});
    Map<String,String> header = {
      "content-type": "application/json"
    };
    final response = await http.post(url,
    headers: header,
    body: body);
    setState(() {
      errortext1 = response.statusCode.toString();
    });
    if (response.statusCode == 201){
      Navigator.pushNamed(context,LoginPage().routename );;
      }
    }
  }
}