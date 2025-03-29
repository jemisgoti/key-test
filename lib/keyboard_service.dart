import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_keyboard/key_type.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:flutter/material.dart';


class KeyboardService {
  static final KeyboardService _instance = KeyboardService._internal();
  factory KeyboardService() => _instance;

  KeyboardService._internal();

  final SoLoud _soloud = SoLoud.instance;
  late AudioSource _source;
  bool _initialized = false;

  bool enableSound = true;

  final TextEditingController inputController = TextEditingController();
  List<List<KeyboardKeyModel>> keyboardLayout = [[]];

  void updateLayout(List<List<KeyboardKeyModel>> keyboardLayout) {
    this.keyboardLayout = keyboardLayout;
  }

  void initialize() async {
    if (_initialized) return;

    await _soloud.init();
    _source = await _soloud.loadAsset('assets/sounds/mechanical_key_click.mp3');
    HardwareKeyboard.instance.addHandler(_handleRawKey);
    _initialized = true;
  }

  void dispose() {
    HardwareKeyboard.instance.removeHandler(_handleRawKey);
    _soloud.deinit();
  }

  bool _handleRawKey(KeyEvent event) {
    if (event is KeyDownEvent) {
      final keyLabel = event.logicalKey.keyLabel;

      handleKeyPress(keyLabel, event.logicalKey);
      return true;
    } else {
      return false;
    }
  }

  /// Core logic to process a key
  void handleKeyPress(String keyLabel, LogicalKeyboardKey key) {
    playKeyClickSound();

    if (key == LogicalKeyboardKey.backspace) {
      final currentText = inputController.text;
      if (currentText.isNotEmpty) {
        inputController.text = currentText.substring(0, currentText.length - 1);
        inputController.selection = TextSelection.fromPosition(
          TextPosition(offset: inputController.text.length),
        );
      }
    } else if (keyLabel.isNotEmpty && keyLabel.length == 1) {
      final updated = inputController.text + keyLabel;
      inputController.text = updated;
      inputController.selection = TextSelection.fromPosition(
        TextPosition(offset: updated.length),
      );
    }
  }

  /// Called by UI key widgets to simulate a press
  void simulateKeyPress(KeyboardKeyModel model) {
    if (model.label == '⌫' || model.label.toLowerCase() == 'backspace') {
      handleKeyPress('', LogicalKeyboardKey.backspace);
    } else {
      final logicalKey = LogicalKeyboardKey(
        model.label.codeUnitAt(0), // basic mapping (can be extended)
      );

      handleKeyPress(model.label, logicalKey);
    }
  }

  Future<void> playKeyClickSound() async {
    if (!enableSound) {
      return;
    }
    try {
      await _soloud.play(_source);
    } catch (e) {
      print('Error playing sound: $e');
    }
  }

  void updateSound(bool value) {
    enableSound = value;
  }

  void reset() {
    inputController.clear();
  }
}
