import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Describes the category or role of a keyboard key.
enum KeyType {
  /// A regular character key (e.g., letters, numbers, symbols).
  character,

  /// A modifier key (e.g., Shift, Ctrl, Alt).
  modifier,

  /// A function key (e.g., F1 to F12).
  function,

  /// A special-purpose key (e.g., Enter, Backspace, Escape).
  special,
}

/// Represents a key on the virtual keyboard with metadata.
///
/// Includes information such as the key label, type, width,
/// and current pressed state.
class KeyboardKeyModel {
  /// Creates a [KeyboardKeyModel] instance.
  ///
  /// [label] is the visible text on the key.
  /// [type] defines the purpose of the key (e.g., character, function).
  /// [key] is the associated [LogicalKeyboardKey].
  /// [width] determines how wide the key appears.
  /// [initiallyPressed] sets the initial press state.
  KeyboardKeyModel({
    required this.label,
    required this.type,
    required this.key,
    this.width = 1.0,
    bool initiallyPressed = false,
  }) : isPressed = ValueNotifier<bool>(initiallyPressed);

  /// The text label shown on the key.
  final String label;

  /// The type of key (character, modifier, function, special).
  final KeyType type;

  /// The visual width multiplier of the key.
  ///
  /// A value of `2.0` makes the key twice as wide as the base width.
  final double width;

  /// A [ValueNotifier] that reflects whether the key is currently pressed.
  final ValueNotifier<bool> isPressed;

  /// The corresponding [LogicalKeyboardKey] used for matching input.
  final LogicalKeyboardKey key;
}
