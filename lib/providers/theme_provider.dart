import 'package:flutter/foundation.dart';

class ThemeProvider with ChangeNotifier {

  bool isDarkMode = false;

  void toggleDarkMode(bool selectedMode) {
    isDarkMode = selectedMode;
    notifyListeners();
  }
  
}