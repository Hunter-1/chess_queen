import 'package:provider/provider.dart';
import 'Model/provider.dart';
import 'gamepage.dart';
import 'gameselectpage.dart';
import 'registerpage.dart';
import 'resultspage.dart';
import 'userpage.dart';
import 'package:flutter/material.dart';
import 'Model/provider.dart';
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
            debugShowCheckedModeBanner: false,
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
      appBar: AppBar(title: Text("Einstellungen", style: TextStyle(color: Colors.blueAccent),),
        iconTheme: IconThemeData(color: Colors.blueAccent),
        backgroundColor: Colors.transparent,
        elevation: 0,),
      body: Column(
        children: <Widget>[
          Container(
            child: Icon(Icons.settings,
            size: 400,),
            margin: EdgeInsets.fromLTRB(0, 20, 0, 150),
          ),
        Container(
          margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
          child: Row(
     children: <Widget>[
          RichText(text: TextSpan(
          text: "Darkmode",
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 40,
              )
          )
    ),
                  Spacer(),
     Switch(value: themeChange.darkTheme, onChanged: (value){
     setState(() {
     themeChange.darkTheme = value;
     });
     })
     ],
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ),
    ],
      ),
    );
  }
  }
}