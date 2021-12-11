import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeProvider({required bool isDarkMode, required bool isIOSPlatform}) {
    _isIOSPlatform = isIOSPlatform ? true : false;
    _isDarkTheme = isDarkMode ? true : false;
  }

  late bool _isDarkTheme;
  late bool _isIOSPlatform;

  bool get isDarkTheme => _isDarkTheme;
  bool get isIOSPlatform => _isIOSPlatform;

  Future<void> toggleTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_isDarkTheme) {
      _isDarkTheme = false;
      prefs.setBool("isDarkTheme", false);
    } else {
      _isDarkTheme = true;
      prefs.setBool("isDarkTheme", true);
    }
    notifyListeners();
  }

  Future<void> togglePlatform() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_isIOSPlatform) {
      _isIOSPlatform = false;
      prefs.setBool("isIOSPlatform", false);
    } else {
      _isIOSPlatform = true;
      prefs.setBool("isIOSPlatform", true);
    }
    notifyListeners();
  }
}
