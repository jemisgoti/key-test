import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard/main.dart';
import 'package:flutter_keyboard/pages/keyboard_screen.dart';
import 'package:flutter_keyboard/utils/utils.dart';

/// The entry screen for the keyboard test application.
///
/// Automatically navigates to the test screen after a short delay
/// (on native platforms), or allows the user to select a layout
/// and start manually (on web).
class KeyboardTestStartScreen extends StatefulWidget {
  /// Creates a [KeyboardTestStartScreen].
  const KeyboardTestStartScreen({super.key});

  @override
  KeyboardTestStartScreenState createState() => KeyboardTestStartScreenState();
}

/// State class for [KeyboardTestStartScreen].
class KeyboardTestStartScreenState extends State<KeyboardTestStartScreen> {
  /// The list of supported keyboard types.
  final List<KeyStyle> keyboardTypes = <KeyStyle>[
    KeyStyle.macos,
    KeyStyle.windows,
  ];

  /// Currently selected keyboard style.
  late KeyStyle selectedKeyboard;

  @override
  void initState() {
    selectedKeyboard =
        kIsWeb
            ? KeyStyle.windows
            : Platform.isWindows
            ? KeyStyle.windows
            : KeyStyle.macos;
    super.initState();

    // Auto navigate on native platforms after short delay
    Future<void>.delayed(const Duration(milliseconds: 500)).then((
      dynamic value,
    ) {
      if (!kIsWeb && mounted) {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder:
                (BuildContext context) => KeyboardScreen(
                  keyStyle:
                      kIsWeb
                          ? KeyStyle.macos
                          : Platform.isWindows
                          ? KeyStyle.windows
                          : KeyStyle.macos,
                ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.containerColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // App Icon
              Image.asset('assets/icons/icon.png', width: 72, height: 72),

              if (kIsWeb) const SizedBox(height: 40),

              // Dropdown for keyboard type (only on Web)
              if (kIsWeb)
                Container(
                  width: 360,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: theme.containerColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<KeyStyle>(
                      value: selectedKeyboard,
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: theme.primaryColor,
                      ),
                      dropdownColor: theme.containerColor,
                      style: TextStyle(color: theme.primaryColor),
                      hint: const Text('Select Keyboard Type'),
                      items:
                          keyboardTypes
                              .map(
                                (KeyStyle type) => DropdownMenuItem<KeyStyle>(
                                  value: type,
                                  child: Text(type.uiName),
                                ),
                              )
                              .toList(),
                      onChanged: (KeyStyle? value) {
                        setState(() {
                          selectedKeyboard = value!;
                        });
                      },
                    ),
                  ),
                ),

              if (kIsWeb) const SizedBox(height: 30),

              // Start button (Web only)
              if (kIsWeb)
                SizedBox(
                  width: 360,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.primaryColor,
                      foregroundColor: theme.containerColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder:
                              (BuildContext context) => KeyboardScreen(
                                keyStyle:
                                    kIsWeb
                                        ? KeyStyle.windows
                                        : Platform.isWindows
                                        ? KeyStyle.windows
                                        : KeyStyle.macos,
                              ),
                        ),
                      );
                    },
                    child: const Text('Start', style: TextStyle(fontSize: 18)),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
