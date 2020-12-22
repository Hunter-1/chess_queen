import 'package:flutter/material.dart';
import 'Model/text.dart';

class ResultsPage extends StatelessWidget{
  final List<String> entries = <String>["A","B","C"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Resultate")),
        body: ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
                child: Center(child: Text("Entry ${entries[index]}")),
            );
          },
        )
      );
  }
}