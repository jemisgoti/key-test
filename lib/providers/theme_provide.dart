import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A [ChangeNotifier] that manages the current app theme mode.
///
/// It persists the selected [ThemeMode] using [SharedPreferences]
/// so that the user's preference is retained across sessions.
class ThemeProvider with ChangeNotifier {
  /// Initializes the [ThemeProvider] and loads the saved theme mode.
  ThemeProvider() {
    _loadThemeMode();
  }

  ThemeMode _themeMode = ThemeMode.light;

  /// Gets the current [ThemeMode].
  ThemeMode get themeMode => _themeMode;

  /// Toggles between light and dark themes.
  ///
  /// Saves the new theme mode and notifies listeners.
  Future<void> toggleTheme() async {
    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
    await _saveThemeMode();
  }

  /// Persists the current theme mode to [SharedPreferences].
  Future<void> _saveThemeMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', _themeMode == ThemeMode.dark);
  }

  /// Loads the theme mode from [SharedPreferences].
  ///
  /// Defaults to light mode if no value is stored.
  Future<void> _loadThemeMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool isDark = prefs.getBool('isDarkMode') ?? false;
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
