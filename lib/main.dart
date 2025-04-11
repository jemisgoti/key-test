import 'package:flutter/material.dart';
import 'package:flutter_keyboard/pages/start_screen.dart';
import 'package:flutter_keyboard/providers/theme_provide.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const KeyboardDemoApp());
}

/// The root widget for the Interactive Keyboard application.
///
/// This sets up the [ThemeProvider] using `ChangeNotifierProvider`
/// and applies light/dark themes dynamically based on user preference.
///
/// The app uses [MaterialApp] with theming and navigation support.
class KeyboardDemoApp extends StatelessWidget {
  /// Creates an instance of [KeyboardDemoApp].
  const KeyboardDemoApp({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider<ThemeProvider>(
    create: (BuildContext context) => ThemeProvider(),
    child: Consumer<ThemeProvider>(
      builder:
          (BuildContext context, ThemeProvider themeProvider, Widget? child) =>
              MaterialApp(
                debugShowCheckedModeBanner: false,

                /// Light theme settings
                theme: ThemeData(
                  colorScheme: const ColorScheme.light(
                    primary: Colors.black,
                    primaryContainer: Colors.white,
                    secondaryContainer: Colors.white,
                    surface: Color(0xFFf4f4f4),
                  ),
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                ),

                /// Dark theme settings
                darkTheme: ThemeData(
                  colorScheme: const ColorScheme.dark(
                    primary: Colors.white,
                    surface: Color(0xFF1E1E1E),
                    primaryContainer: Color(0xFF343434),
                    secondaryContainer: Color(0xFF262626),
                  ),
                ),

                /// The starting screen of the app
                home: const KeyboardTestStartScreen(),

                /// Apply theme based on [ThemeProvider]
                themeMode: themeProvider.themeMode,
              ),
    ),
  );
}

/// Extension on [ThemeData] to simplify access to common text styles
/// and color values used throughout the app.
extension ThemeExtension on ThemeData {
  /// Title style used for onboarding titles.
  TextStyle get onBoardingTitle =>
      textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w600);

  /// Description style used for onboarding subtitles or helper text.
  TextStyle get onBoardingDescription => textTheme.titleMedium!.copyWith(
    fontWeight: FontWeight.w400,
    color: colorScheme.onSurface.withValues(alpha: 0.6),
    height: 26 / 16,
    fontSize: 16,
  );

  /// Primary color used across the app.
  Color get primaryColor => colorScheme.primary;

  /// Surface color used for background surfaces (cards, containers).
  Color get surfaceColor => colorScheme.surface;

  /// Container background color.
  Color get containerColor => colorScheme.primaryContainer;
}
