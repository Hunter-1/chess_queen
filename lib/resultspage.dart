import 'dart:convert';

import 'package:chess_queen/config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Model/score.dart';

class ResultsPage extends StatelessWidget{
  final List<String> entries = <String>["A","B","C"];
  List<Score> scorelist;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Resultate")),
      body: FutureBuilder<List<Score>>(
        future: fetchAllScoreData(),
        initialData: [],
        builder: (context, snapshot){
          return snapshot.hasData
              ? ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (_, int position){
                final item = snapshot.data[position];
                return Card(
                  child: ListTile(
                    title: Text(
                      item.username +": moves: "+item.moves.toString()
                          +" seconds: "+item.secondspassed.toString() + " isQueen: "
                    + item.isqueen.toString()),
                    ),
                  );
              }
          )
              : Center(
            child: CircularProgressIndicator(),
          );
        }
      ),
    );
    /**
    return Scaffold(
        appBar: AppBar(title: Text("Resultate")),
        body: ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: scorelist.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
                child: Center(child: Text("Entry ${scorelist[index].username}")),
            );
          },
        )
      ); **/
  }
  Future<List<Score>> fetchAllScoreData() async {
    var url = config.getUrl() + "scores";
    final response = await http.get(url);
    if (response.statusCode == 200){
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      List<Score> parsedScores = parsed.map<Score>((json) => Score.fromJson(json))
          .toList();
      scorelist = parsedScores;
      return parsedScores;
    }
  }
}