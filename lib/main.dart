import 'package:flutter/material.dart';
import 'package:flutter_keyboard/start_screen.dart';
import 'keyboard_screen.dart';

void main() {
  runApp(KeyboardDemoApp());
}

class KeyboardDemoApp extends StatelessWidget {
  const KeyboardDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interactive Keyboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: KeyboardTestStartScreen(),
    );
  }
}
