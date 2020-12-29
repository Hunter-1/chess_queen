import 'package:chess_queen/Model/provider.dart';
import 'package:chess_queen/gamepage.dart';
import 'package:chess_queen/gameselectpage.dart';
import 'package:chess_queen/registerpage.dart';
import 'package:chess_queen/resultspage.dart';
import 'package:chess_queen/userpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Model/style.dart';
import 'homepage.dart';
import 'loginpage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  String routename ="/";
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
    await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) {
      return themeChangeProvider;
    },
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, Widget child){
          return MaterialApp(
            title: '8 Queens Puzzle',
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            initialRoute: MyApp().routename,
            routes:{
              MyApp().routename: (context) => HomePage(),
              LoginPage().routename: (context) => LoginPage(),
              SettingsPage().routename: (context) => SettingsPage(),
              UserPage().routename: (context) => UserPage(),
              RegisterPage().routename: (context) => RegisterPage(),
              GameSelectPage().routename: (context) => GameSelectPage(),
              GamePage(true).routequeen: (context) => GamePage(true),
              GamePage(false).routerook: (context) => GamePage(false),
              ResultsPage().routename: (context) => ResultsPage()
            },
          );
        }
      )
    );
  }
}

class SettingsPage extends StatefulWidget {
  String routename = "/settings";
  @override
  SettingsPageState createState() => new SettingsPageState();
}

class SettingsPageState extends State<SettingsPage>{
  @override
  Widget build(BuildContext context) {
    {
      final themeChange = Provider.of<DarkThemeProvider>(context);
      return Scaffold(
      appBar: AppBar(title: Text("Einstellungen")),
      body: Column(
     children: <Widget>[
      RichText(text: TextSpan(
      text: "Darkmode",
          style: TextStyle(
              color: Colors.black,
              fontSize: 40
          )
      )
    ),
     Switch(value: themeChange.darkTheme, onChanged: (value){
     setState(() {
     themeChange.darkTheme = value;
     });
     })
     ],
     ),
    );
  }
  }
}