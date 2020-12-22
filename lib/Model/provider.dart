import 'package:chess_queen/Model/preferences.dart';
import 'package:flutter/cupertino.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemePreference darkThemePreference = DarkThemePreference();
  bool isdarkTheme = false;
  bool get darkTheme => isdarkTheme;
  set darkTheme(bool value){
    isdarkTheme = value;
    darkThemePreference.setDarkThem(value);
    notifyListeners();
  }
}