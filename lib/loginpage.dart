import 'dart:convert';
import 'package:chess_queen/Model/user.dart';
import 'package:chess_queen/Model/text.dart';
import 'package:chess_queen/config.dart';
import 'package:chess_queen/registerpage.dart';
import 'package:chess_queen/userpage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget{
  String routename = "/login";
  @override
  LoginPageState createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  String loadingText=" ";
  String errorText=" ";

  @override
  void dispose() {
    userController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Anmelden")),
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
              CustomButton(text: "Anmelden", onPressed: () =>
                  fetchUserData(
                    userController.text, passwordController.text
                  )),
              CustomButton(text: "Neuer Benutzer", onPressed: () {Navigator.pushNamed(context,RegisterPage().routename );}),
              Text(loadingText),
              Text(errorText)
          ]
        )
    );
  }
  fetchUserData(String username, String password) async {
    var url = config.getUrl() + "users/" + username;
    setState(() {
      loadingText = url;
    });
    final response = await http.get(url);
    if (response.statusCode == 200){
        final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
        List<User> parsedUsers = parsed.map<User>((json) => User.fromJson(json))
            .toList();
        User user = parsedUsers.first;
        if (user.password == password) {
          Navigator.pushNamed(context, UserPage().routename, arguments: user);
        } else {
          errorText = "incorrect password";
        }
    } else {
      setState(() {
        errorText = response.statusCode.toString();
      });
    }
  }
}