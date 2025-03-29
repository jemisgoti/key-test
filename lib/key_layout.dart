import 'package:flutter_keyboard/key_type.dart';

final List<List<KeyboardKeyModel>> macKeyboardLayout = [
  // Row 1 (Escape + Function keys + Eject)
  [
    KeyboardKeyModel(label: 'esc', type: KeyType.special, width: 1.5),
    KeyboardKeyModel(label: 'F1', type: KeyType.special, width: 1),
    KeyboardKeyModel(label: 'F2', type: KeyType.special, width: 1),
    KeyboardKeyModel(label: 'F3', type: KeyType.special, width: 1),
    KeyboardKeyModel(label: 'F4', type: KeyType.special, width: 1),
    KeyboardKeyModel(label: 'F5', type: KeyType.special, width: 1),
    KeyboardKeyModel(label: 'F6', type: KeyType.special, width: 1),
    KeyboardKeyModel(label: 'F7', type: KeyType.special, width: 1),
    KeyboardKeyModel(label: 'F8', type: KeyType.special, width: 1),
    KeyboardKeyModel(label: 'F9', type: KeyType.special, width: 1),
    KeyboardKeyModel(label: 'F10', type: KeyType.special, width: 1),
    KeyboardKeyModel(label: 'F11', type: KeyType.special, width: 1),
    KeyboardKeyModel(label: 'F12', type: KeyType.special, width: 1),
    KeyboardKeyModel(label: 'eject', type: KeyType.special, width: 1),
  ],

  // Row 2 (numbers)
  [
    KeyboardKeyModel(label: '`', type: KeyType.character, width: 1),
    KeyboardKeyModel(label: '1', type: KeyType.character, width: 1),
    KeyboardKeyModel(label: '2', type: KeyType.character, width: 1),
    KeyboardKeyModel(label: '3', type: KeyType.character, width: 1),
    KeyboardKeyModel(label: '4', type: KeyType.character, width: 1),
    KeyboardKeyModel(label: '5', type: KeyType.character, width: 1),
    KeyboardKeyModel(label: '6', type: KeyType.character, width: 1),
    KeyboardKeyModel(label: '7', type: KeyType.character, width: 1),
    KeyboardKeyModel(label: '8', type: KeyType.character, width: 1),
    KeyboardKeyModel(label: '9', type: KeyType.character, width: 1),
    KeyboardKeyModel(label: '0', type: KeyType.character, width: 1),
    KeyboardKeyModel(label: '-', type: KeyType.character, width: 1),
    KeyboardKeyModel(label: '=', type: KeyType.character, width: 1),
    KeyboardKeyModel(label: 'delete', type: KeyType.special, width: 1.5),
  ],

  // Row 3 (QWERTY row)
  [
    KeyboardKeyModel(label: 'tab', type: KeyType.special, width: 1.5),
    KeyboardKeyModel(label: 'Q', type: KeyType.character, width: 1),
    KeyboardKeyModel(label: 'W', type: KeyType.character, width: 1),
    KeyboardKeyModel(label: 'E', type: KeyType.character, width: 1),
    KeyboardKeyModel(label: 'R', type: KeyType.character, width: 1),
    KeyboardKeyModel(label: 'T', type: KeyType.character, width: 1),
    KeyboardKeyModel(label: 'Y', type: KeyType.character, width: 1),
    KeyboardKeyModel(label: 'U', type: KeyType.character, width: 1),
    KeyboardKeyModel(label: 'I', type: KeyType.character, width: 1),
    KeyboardKeyModel(label: 'O', type: KeyType.character, width: 1),
    KeyboardKeyModel(label: 'P', type: KeyType.character, width: 1),
    KeyboardKeyModel(label: '[', type: KeyType.character, width: 1),
    KeyboardKeyModel(label: ']', type: KeyType.character, width: 1),
    KeyboardKeyModel(label: '\\', type: KeyType.character, width: 1.5),
  ],

  // Row 4 (ASDF row)
  [
    KeyboardKeyModel(label: 'caps', type: KeyType.special, width: 1.75),
    KeyboardKeyModel(label: 'A', type: KeyType.character, width: 1),
    KeyboardKeyModel(label: 'S', type: KeyType.character, width: 1),
    KeyboardKeyModel(label: 'D', type: KeyType.character, width: 1),
    KeyboardKeyModel(label: 'F', type: KeyType.character, width: 1),
    KeyboardKeyModel(label: 'G', type: KeyType.character, width: 1),
    KeyboardKeyModel(label: 'H', type: KeyType.character, width: 1),
    KeyboardKeyModel(label: 'J', type: KeyType.character, width: 1),
    KeyboardKeyModel(label: 'K', type: KeyType.character, width: 1),
    KeyboardKeyModel(label: 'L', type: KeyType.character, width: 1),
    KeyboardKeyModel(label: ';', type: KeyType.character, width: 1),
    KeyboardKeyModel(label: '\'', type: KeyType.character, width: 1),
    KeyboardKeyModel(label: 'return', type: KeyType.special, width: 1.75),
  ],

  // Row 5 (ZXCV row)
  [
    KeyboardKeyModel(label: 'shift', type: KeyType.special, width: 2.25),
    KeyboardKeyModel(label: 'Z', type: KeyType.character, width: 1),
    KeyboardKeyModel(label: 'X', type: KeyType.character, width: 1),
    KeyboardKeyModel(label: 'C', type: KeyType.character, width: 1),
    KeyboardKeyModel(label: 'V', type: KeyType.character, width: 1),
    KeyboardKeyModel(label: 'B', type: KeyType.character, width: 1),
    KeyboardKeyModel(label: 'N', type: KeyType.character, width: 1),
    KeyboardKeyModel(label: 'M', type: KeyType.character, width: 1),
    KeyboardKeyModel(label: ',', type: KeyType.character, width: 1),
    KeyboardKeyModel(label: '.', type: KeyType.character, width: 1),
    KeyboardKeyModel(label: '/', type: KeyType.character, width: 1),
    KeyboardKeyModel(label: 'shift', type: KeyType.special, width: 2.25),
  ],

  // Row 6 (Bottom row)
  [
    KeyboardKeyModel(label: 'fn', type: KeyType.special, width: 1),
    KeyboardKeyModel(label: 'control', type: KeyType.special, width: 1),
    KeyboardKeyModel(label: 'option', type: KeyType.special, width: 1),
    KeyboardKeyModel(label: 'command', type: KeyType.special, width: 1.15),
    KeyboardKeyModel(label: '', type: KeyType.special, width: 5),
    KeyboardKeyModel(label: 'command', type: KeyType.special, width: 1.15),
    KeyboardKeyModel(label: 'option', type: KeyType.special, width: 1),
    KeyboardKeyModel(label: '←', type: KeyType.special, width: 1),
    // KeyboardKeyModel(label: '↑', type: KeyType.special, width: 1),
    KeyboardKeyModel(label: '↓', type: KeyType.special, width: 1),
    KeyboardKeyModel(label: '→', type: KeyType.special, width: 1),
  ],
];
