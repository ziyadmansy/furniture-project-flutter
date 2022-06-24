import 'package:flutter/foundation.dart';

class ThemeProvider with ChangeNotifier {

  bool isDarkMode = true;

  void toggleDarkMode(bool selectedMode) {
    isDarkMode = selectedMode;
    notifyListeners();
  }
  
}