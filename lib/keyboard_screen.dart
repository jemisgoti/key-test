import 'package:flutter/material.dart';
import 'package:flutter_keyboard/keyboard_service.dart';
import 'package:flutter_keyboard/keyboard_toolbar.dart';
import 'package:flutter_keyboard/macos.dart';

class KeyboardScreen extends StatefulWidget {
  const KeyboardScreen({super.key});

  @override
  KeyboardScreenState createState() => KeyboardScreenState();
}

class KeyboardScreenState extends State<KeyboardScreen> {
  final FocusNode _focusNode = FocusNode();
  KeyboardService keyboardService = KeyboardService();

  @override
  void initState() {
    super.initState();
    keyboardService.initialize();
    _focusNode.requestFocus(); // So it receives key input
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf4f4f4),

      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            KeyboardToolbar(
              onPlatformChanged: (isMac) => print('Platform: $isMac'),
              onTestChanged: (type) {},

              onLayoutChanged: (layout) => print('Layout: $layout'),
              onSoundToggle: (on) => keyboardService.updateSound(on),
              onReset: () => keyboardService.reset(),
              soundOn: keyboardService.enableSound,
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),

              child: TextField(
                controller: keyboardService.inputController,
                focusNode: _focusNode,

                decoration: InputDecoration(
                  hintText: 'Start typing...',
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    offset: Offset(6, 6),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(8.0),

              child: MacOs(
                onPressed: (keyModel) {
                  keyboardService.simulateKeyPress(keyModel);
                },
                onMouseDown: (keyModel) {
                  keyboardService.simulateKeyPress(keyModel);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // RawKeyboard.instance.removeListener(_handleKeyPress);
    _focusNode.dispose();
    keyboardService.dispose();
    super.dispose();
  }
}
