import 'dart:async';
import 'package:flutter/material.dart';

import 'Model/text.dart';

class GamePage extends StatefulWidget {
  final bool isQueen;
  GamePage(this.isQueen);

  @override
  GamePageState createState() => new GamePageState(isQueen);
}

class GamePageState extends State<GamePage> {
  GamePageState(this.isQueen);
  bool isQueen;
  var selected = [];
  var letters = ["a", "b", "c", "d", "e", "f", "g", "h",];
  var numbers = ["1", "2", "3", "4", "5", "6", "7", "8",];
  int moves = 0;
  int secondsPassed = 0;
  bool isActive = true;
  Timer timer;
  void handleTick() {
    if(isActive) {
      if (this.mounted) {
        setState(() {
          secondsPassed = secondsPassed + 1;
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    if (timer == null)
      timer = Timer.periodic(Duration(seconds: 1), (Timer t)
      {
        handleTick();
      });

    return Scaffold(
        appBar: AppBar(title: Text("Chess Game")),
        body: Column(children: <Widget>[
          new GridView.builder(
            shrinkWrap: true,
            itemCount: 64,
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 8,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0),
            itemBuilder: (BuildContext context, int index) {
              var row;
              (index / 8).floor() % 2 == 0 ? row = 0 : row = 1;
              return Container(
                color: (index % 2) + row == 1 ? Colors.white : Colors.black,
                child: new IconButton(
                  icon: selected.contains(
                      letters[(index / 8).floor()] + numbers[index % 8])
                      ? isQueen ? Image.asset("assets/images/queen.png") :
                  Image.asset("assets/images/rook.png") :
                  Image.asset("assets/images/blank.png"),
                  onPressed: () {
                    String id = letters[(index / 8).floor()] +
                        numbers[index % 8];
                    toggleSelected(id);
                  },
                ),
              );
            },
          ),
          CustomText(text: "Züge: " + moves.toString()),
          timeText(),
        ]
        )
    );
  }

  void toggleSelected(String id) {
    setState(() {
      var change = true;
      if (!selected.contains(id)) {
        for (var i = 0; i < selected.length; i++) {
          String check = selected[i];
          String checkLetter = check.substring(0, 1);
          String checkNumber = check.substring(1, 2);
          String idLetter = id.substring(0, 1);
          String idNumber = id.substring(1, 2);
          if (idLetter == checkLetter || idNumber == checkNumber) {
            change = false;
            break;
          }
          if (isQueen){
            int checkLetterPos = letters.indexOf(checkLetter);
            int checkNumberPos = numbers.indexOf(checkNumber);
            int idLetterPos = letters.indexOf(idLetter);
            int idNumberPos = numbers.indexOf(idNumber);
            double diagonal = (checkLetterPos-idLetterPos)/(checkNumberPos-idNumberPos);
            if (diagonal == 1 || diagonal == -1){
              change = false;
              break;
            }
          }
        }
        if (change) {
          selected.add(id);
          moves++;
          if (selected.length == 8){
            winState();
          }
        }
      } else {
        selected.remove(id);
        if (isActive == false){
          isActive = true;
        }
      }
    });
  }

  void winState(){
    isActive = false;
    showDialog(context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                        text: "You Win",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 40
                        )
                    ),
                  ),
                  CustomText(text: "Züge: " + moves.toString()),
                  timeText(),
                ],
              )
          );
        }
    );
  }
  CustomText timeText(){
    int seconds = secondsPassed % 60;
    int minutes = secondsPassed ~/ 60;
    return
      CustomText(text: "Zeit: " + minutes.toString().padLeft(2,"0") + ":"
          + seconds.toString().padLeft(2,"0"));
  }
}