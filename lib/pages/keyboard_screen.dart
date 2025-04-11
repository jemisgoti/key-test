import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard/keyboard_service.dart';
import 'package:flutter_keyboard/main.dart';
import 'package:flutter_keyboard/pages/macos.dart';
import 'package:flutter_keyboard/pages/windows.dart';
import 'package:flutter_keyboard/utils/key_type.dart';
import 'package:flutter_keyboard/utils/utils.dart';
import 'package:flutter_keyboard/widgets/anti_ghosting_details.dart';
import 'package:flutter_keyboard/widgets/keyboard_toolbar.dart';

/// A screen that displays an interactive keyboard test interface.
///
/// Depending on the selected [KeyStyle], it will render a macOS or
/// Windows style keyboard. It supports various testing modes,
/// including typing and anti-ghosting.
class KeyboardScreen extends StatefulWidget {
  /// Creates a [KeyboardScreen] with a given [keyStyle].
  const KeyboardScreen({required this.keyStyle, super.key});

  /// The keyboard layout style (macOS or Windows).
  final KeyStyle keyStyle;

  @override
  KeyboardScreenState createState() => KeyboardScreenState();
}

/// State class for [KeyboardScreen], handling rendering and input logic.
class KeyboardScreenState extends State<KeyboardScreen> {
  final FocusNode _focusNode = FocusNode();

  /// Service managing keyboard layout, state, and input handling.
  late KeyboardService keyboardService;

  @override
  void initState() {
    super.initState();

    keyboardService = KeyboardService(
      keyStyle: widget.keyStyle,
      keyboardStyle: KeyboardStyle.sixtyPercent,
      keyboardTestType: KeyboardTestType.typing,
    );

    keyboardService.initialize();
    _focusNode.requestFocus(); // Focus the text input
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.surfaceColor,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Column(
                children: <Widget>[
                  /// Top control panel with layout/sound/test mode controls
                  KeyboardToolbar(
                    keyboardService: keyboardService,
                    onPlatformChanged: (KeyStyle platform) {
                      keyboardService.keyStyle = platform;
                      setState(() {});
                    },
                    onTestChanged: (KeyboardTestType type) {
                      keyboardService.keyboardTestType = type;
                      setState(() {});
                    },
                    onLayoutChanged: (KeyboardStyle layout) {
                      keyboardService.keyboardStyle = layout;
                      setState(() {});
                    },
                    onSoundToggle: (bool on) {
                      keyboardService.soundEnabled = on;
                    },
                    onReset: () => keyboardService.reset(),
                  ),
                  const SizedBox(height: 16),

                  /// Typing or anti-ghosting input area
                  if (keyboardService.keyboardTestType ==
                      KeyboardTestType.antiGhosting)
                    AntiGhostingDetails(keyboardService: keyboardService)
                  else
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: theme.containerColor,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        controller: keyboardService.inputController,
                        focusNode: _focusNode,
                        decoration: const InputDecoration(
                          hintText: 'Start typing...',
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  const SizedBox(height: 16),

                  /// Keyboard layout display (macOS or Windows)
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: theme.containerColor,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: theme.primaryColor.withValues(alpha: 0.05),
                          offset: const Offset(6, 6),
                        ),
                      ],
                    ),
                    child: Builder(
                      builder: (BuildContext context) {
                        if (keyboardService.keyStyle == KeyStyle.windows) {
                          return WindowsKeyboard(
                            keyboardService: keyboardService,
                            onKeyPress:
                                (KeyboardKeyModel keyModel) => keyboardService
                                    .handleKeyPress(keyModel.key),
                            onKeyRelease:
                                (KeyboardKeyModel keyModel) => keyboardService
                                    .handleKeyRelease(keyModel.key),
                          );
                        }
                        return MacOs(
                          keyboardService: keyboardService,
                          onKeyPress:
                              (KeyboardKeyModel keyModel) =>
                                  keyboardService.handleKeyPress(keyModel.key),
                          onKeyRelease:
                              (KeyboardKeyModel keyModel) => keyboardService
                                  .handleKeyRelease(keyModel.key),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),

                  /// Info footer (e.g., for WASM build)
                  const Text('WASM: $kIsWasm'),
                ],
              ),
            ),
            if (MediaQuery.sizeOf(context).width < 820)
              Positioned.fill(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: 0.75),
                  ),
                  child: Center(
                    child: Text(
                      'Please maximize window for better experience.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    keyboardService.dispose();
    super.dispose();
  }
}
