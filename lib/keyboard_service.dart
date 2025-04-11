import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard/utils/key_layout.dart';
import 'package:flutter_keyboard/utils/key_type.dart';
import 'package:flutter_keyboard/utils/utils.dart';
import 'package:flutter_soloud/flutter_soloud.dart';

/// A service that manages key press behavior, sound effects, keyboard
/// layout, and user input for a virtual keyboard.
class KeyboardService {
  /// Creates a [KeyboardService] with the given styles and test type.
  ///
  /// Initializes the keyboard layout based on the [keyStyle].
  KeyboardService({
    required this.keyStyle,
    required this.keyboardStyle,
    required this.keyboardTestType,
  }) {
    switch (keyStyle) {
      case KeyStyle.macos:
        keyboardLayout = macKeyboardLayout;
      case KeyStyle.windows:
        keyboardLayout = macKeyboardLayout;
    }
  }

  /// The SoLoud audio engine instance.
  final SoLoud soloud = SoLoud.instance;

  /// The loaded audio source for key click sounds.
  late AudioSource _source;

  /// Whether the service has already been initialized.
  bool _initialized = false;

  /// Whether key click sound effects are enabled.
  bool _soundEnabled = true;

  /// Style used for key shapes and labels (e.g., macOS, Windows).
  KeyStyle keyStyle;

  /// Visual layout style of the keyboard.
  KeyboardStyle keyboardStyle;

  /// The current keyboard test mode.
  KeyboardTestType keyboardTestType;

  /// Controller for managing user input text.
  final TextEditingController inputController = TextEditingController();

  /// The complete layout of keys as a 2D list.
  List<List<KeyboardKeyModel>> keyboardLayout = <List<KeyboardKeyModel>>[
    <KeyboardKeyModel>[],
  ];

  /// A set of currently pressed keys.
  Set<LogicalKeyboardKey> pressed = <LogicalKeyboardKey>{};

  /// A stream for broadcasting key press state changes.
  StreamController<Set<LogicalKeyboardKey>> streamController =
      StreamController<Set<LogicalKeyboardKey>>.broadcast();

  /// Updates the keyboard layout dynamically.
  set layout(List<List<KeyboardKeyModel>> keyboardLayout) =>
      this.keyboardLayout = keyboardLayout;

  /// Returns the current keyboard layout.
  List<List<KeyboardKeyModel>> get layout => keyboardLayout;

  /// Initializes the keyboard service.
  ///
  /// Loads sound assets and attaches keyboard event listeners.
  Future<void> initialize() async {
    if (_initialized) {
      return;
    }
    await soloud.init();
    _source = await soloud.loadAsset('assets/sounds/short-sound.mp3');
    HardwareKeyboard.instance.addHandler(handleRawKey);
    _initialized = true;
  }

  /// Disposes resources and removes keyboard listeners.
  void dispose() {
    HardwareKeyboard.instance.removeHandler(handleRawKey);
    soloud.deinit();
  }

  /// Handles raw key events from the system.
  ///
  /// Delegates to key press or key release handlers.
  bool handleRawKey(KeyEvent event) {
    if (event is KeyDownEvent) {
      handleKeyPress(event.logicalKey);
    } else if (event is KeyUpEvent) {
      handleKeyRelease(event.logicalKey);
    }
    return true;
  }

  /// Handles the logic when a key is pressed.
  ///
  /// Updates input, highlights key, and plays sound if enabled.
  void handleKeyPress(LogicalKeyboardKey key) {
    debugPrint(keyboardTestType.toString());

    pressed.add(key);
    streamController.add(pressed);
    highlightKey(key);
    playKeyClickSound();

    if (keyboardTestType != KeyboardTestType.typing) {
      return;
    }

    final String text = inputController.text;
    final TextSelection selection = inputController.selection;
    final int baseOffset = selection.baseOffset;
    final int extentOffset = selection.extentOffset;
    final bool isTextSelected = baseOffset != extentOffset;

    String newText = text;
    int newOffset = baseOffset;

    if (key == LogicalKeyboardKey.backspace) {
      if (isTextSelected) {
        newText = text.replaceRange(baseOffset, extentOffset, '');
        newOffset = baseOffset;
      } else if (baseOffset > 0) {
        newText = text.replaceRange(baseOffset - 1, baseOffset, '');
        newOffset = baseOffset - 1;
      }
    } else if (key == LogicalKeyboardKey.space) {
      newText = text.replaceRange(baseOffset, extentOffset, ' ');
      newOffset = baseOffset + 1;
    } else if (key.keyLabel.isNotEmpty && key.keyLabel.length == 1) {
      newText = text.replaceRange(baseOffset, extentOffset, key.keyLabel);
      newOffset = baseOffset + 1;
    }

    inputController.text = newText;
    inputController.selection = TextSelection.collapsed(offset: newOffset);
  }

  /// Highlights the matching key in the layout as pressed.
  Future<void> highlightKey(LogicalKeyboardKey key) async {
    for (final List<KeyboardKeyModel> row in keyboardLayout) {
      for (final KeyboardKeyModel keyModel in row) {
        if (keyModel.key.keyId == key.keyId) {
          keyModel.isPressed.value = true;
          return;
        }
      }
    }
  }

  /// Handles the logic when a key is released.
  ///
  /// Removes it from the pressed set and updates visual state.
  Future<void> handleKeyRelease(LogicalKeyboardKey key) async {
    pressed.remove(key);
    streamController.add(pressed);

    if (keyboardTestType == KeyboardTestType.keyTest) {
      return;
    }

    for (final List<KeyboardKeyModel> row in keyboardLayout) {
      for (final KeyboardKeyModel keyModel in row) {
        if (keyModel.key.keyId == key.keyId) {
          keyModel.isPressed.value = false;
          return;
        }
      }
    }
  }

  /// Plays a key click sound using the loaded audio source.
  Future<void> playKeyClickSound() async {
    if (!_soundEnabled) {
      return;
    }
    try {
      await soloud.play(_source);
    } on Exception catch (e) {
      log('Error playing sound: $e');
    }
  }

  /// Enables or disables key click sounds.
  set soundEnabled(bool value) {
    _soundEnabled = value;
  }

  /// Returns whether key click sound effects are enabled.
  bool get soundEnabled => _soundEnabled;

  /// Clears the input, release all keys, and resets the keyboard state.
  Future<void> reset() async {
    inputController.clear();
    pressed.clear();

    for (final List<KeyboardKeyModel> row in keyboardLayout) {
      for (final KeyboardKeyModel keyModel in row) {
        if (keyModel.isPressed.value) {
          keyModel.isPressed.value = false;
          await Future<void>.delayed(const Duration(milliseconds: 7));
        }
      }
    }
  }
}
