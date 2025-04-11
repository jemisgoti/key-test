import 'package:flutter/services.dart';
import 'package:flutter_keyboard/utils/key_type.dart';

final List<List<KeyboardKeyModel>> macKeyboardLayout = <List<KeyboardKeyModel>>[
  // Row 1 (Escape + Function keys + Eject)
  <KeyboardKeyModel>[
    KeyboardKeyModel(
      label: 'esc',
      type: KeyType.special,
      width: 1.5,
      key: LogicalKeyboardKey.escape,
    ),
    KeyboardKeyModel(
      label: 'F1',
      type: KeyType.special,
      key: LogicalKeyboardKey.f1,
    ),
    KeyboardKeyModel(
      label: 'F2',
      type: KeyType.special,
      key: LogicalKeyboardKey.f2,
    ),
    KeyboardKeyModel(
      label: 'F3',
      type: KeyType.special,
      key: LogicalKeyboardKey.f3,
    ),
    KeyboardKeyModel(
      label: 'F4',
      type: KeyType.special,
      key: LogicalKeyboardKey.f4,
    ),
    KeyboardKeyModel(
      label: 'F5',
      type: KeyType.special,
      key: LogicalKeyboardKey.f5,
    ),
    KeyboardKeyModel(
      label: 'F6',
      type: KeyType.special,
      key: LogicalKeyboardKey.f6,
    ),
    KeyboardKeyModel(
      label: 'F7',
      type: KeyType.special,
      key: LogicalKeyboardKey.f7,
    ),
    KeyboardKeyModel(
      label: 'F8',
      type: KeyType.special,
      key: LogicalKeyboardKey.f8,
    ),
    KeyboardKeyModel(
      label: 'F9',
      type: KeyType.special,
      key: LogicalKeyboardKey.f9,
    ),
    KeyboardKeyModel(
      label: 'F10',
      type: KeyType.special,
      key: LogicalKeyboardKey.f10,
    ),
    KeyboardKeyModel(
      label: 'F11',
      type: KeyType.special,
      key: LogicalKeyboardKey.f11,
    ),
    KeyboardKeyModel(
      label: 'F12',
      type: KeyType.special,
      key: LogicalKeyboardKey.f12,
    ),
    KeyboardKeyModel(
      label: 'eject',
      type: KeyType.special,
      key: LogicalKeyboardKey.eject,
    ),
  ],

  // Row 2 (numbers)
  <KeyboardKeyModel>[
    KeyboardKeyModel(
      label: '`',
      type: KeyType.character,
      key: LogicalKeyboardKey.backquote,
    ),
    KeyboardKeyModel(
      label: '1',
      type: KeyType.character,
      key: LogicalKeyboardKey.digit1,
    ),
    KeyboardKeyModel(
      label: '2',
      type: KeyType.character,
      key: LogicalKeyboardKey.digit2,
    ),
    KeyboardKeyModel(
      label: '3',
      type: KeyType.character,
      key: LogicalKeyboardKey.digit3,
    ),
    KeyboardKeyModel(
      label: '4',
      type: KeyType.character,
      key: LogicalKeyboardKey.digit4,
    ),
    KeyboardKeyModel(
      label: '5',
      type: KeyType.character,
      key: LogicalKeyboardKey.digit5,
    ),
    KeyboardKeyModel(
      label: '6',
      type: KeyType.character,
      key: LogicalKeyboardKey.digit6,
    ),
    KeyboardKeyModel(
      label: '7',
      type: KeyType.character,
      key: LogicalKeyboardKey.digit7,
    ),
    KeyboardKeyModel(
      label: '8',
      type: KeyType.character,
      key: LogicalKeyboardKey.digit8,
    ),
    KeyboardKeyModel(
      label: '9',
      type: KeyType.character,
      key: LogicalKeyboardKey.digit9,
    ),
    KeyboardKeyModel(
      label: '0',
      type: KeyType.character,
      key: LogicalKeyboardKey.digit0,
    ),
    KeyboardKeyModel(
      label: '-',
      type: KeyType.character,
      key: LogicalKeyboardKey.minus,
    ),
    KeyboardKeyModel(
      label: '=',
      type: KeyType.character,
      key: LogicalKeyboardKey.equal,
    ),
    KeyboardKeyModel(
      label: 'delete',
      type: KeyType.special,
      width: 1.5,
      key: LogicalKeyboardKey.delete,
    ),
  ],

  // Row 3 (QWERTY row)
  <KeyboardKeyModel>[
    KeyboardKeyModel(
      label: 'tab',
      type: KeyType.special,
      width: 1.5,
      key: LogicalKeyboardKey.tab,
    ),
    KeyboardKeyModel(
      label: 'Q',
      type: KeyType.character,
      key: LogicalKeyboardKey.keyQ,
    ),
    KeyboardKeyModel(
      label: 'W',
      type: KeyType.character,
      key: LogicalKeyboardKey.keyW,
    ),
    KeyboardKeyModel(
      label: 'E',
      type: KeyType.character,
      key: LogicalKeyboardKey.keyE,
    ),
    KeyboardKeyModel(
      label: 'R',
      type: KeyType.character,
      key: LogicalKeyboardKey.keyR,
    ),
    KeyboardKeyModel(
      label: 'T',
      type: KeyType.character,
      key: LogicalKeyboardKey.keyT,
    ),
    KeyboardKeyModel(
      label: 'Y',
      type: KeyType.character,
      key: LogicalKeyboardKey.keyY,
    ),
    KeyboardKeyModel(
      label: 'U',
      type: KeyType.character,
      key: LogicalKeyboardKey.keyU,
    ),
    KeyboardKeyModel(
      label: 'I',
      type: KeyType.character,
      key: LogicalKeyboardKey.keyI,
    ),
    KeyboardKeyModel(
      label: 'O',
      type: KeyType.character,
      key: LogicalKeyboardKey.keyO,
    ),
    KeyboardKeyModel(
      label: 'P',
      type: KeyType.character,
      key: LogicalKeyboardKey.keyP,
    ),
    KeyboardKeyModel(
      label: '[',
      type: KeyType.character,
      key: LogicalKeyboardKey.bracketLeft,
    ),
    KeyboardKeyModel(
      label: ']',
      type: KeyType.character,
      key: LogicalKeyboardKey.bracketRight,
    ),
    KeyboardKeyModel(
      label: r'\',
      type: KeyType.character,
      key: LogicalKeyboardKey.backslash,
    ),
  ],

  // Row 4 (ASDF row)
  <KeyboardKeyModel>[
    KeyboardKeyModel(
      label: 'caps',
      type: KeyType.special,
      width: 1.78125,
      key: LogicalKeyboardKey.capsLock,
    ),
    KeyboardKeyModel(
      label: 'A',
      type: KeyType.character,
      key: LogicalKeyboardKey.keyA,
    ),
    KeyboardKeyModel(
      label: 'S',
      type: KeyType.character,
      key: LogicalKeyboardKey.keyS,
    ),
    KeyboardKeyModel(
      label: 'D',
      type: KeyType.character,
      key: LogicalKeyboardKey.keyD,
    ),
    KeyboardKeyModel(
      label: 'F',
      type: KeyType.character,
      key: LogicalKeyboardKey.keyF,
    ),
    KeyboardKeyModel(
      label: 'G',
      type: KeyType.character,
      key: LogicalKeyboardKey.keyG,
    ),
    KeyboardKeyModel(
      label: 'H',
      type: KeyType.character,
      key: LogicalKeyboardKey.keyH,
    ),
    KeyboardKeyModel(
      label: 'J',
      type: KeyType.character,
      key: LogicalKeyboardKey.keyJ,
    ),
    KeyboardKeyModel(
      label: 'K',
      type: KeyType.character,
      key: LogicalKeyboardKey.keyK,
    ),
    KeyboardKeyModel(
      label: 'L',
      type: KeyType.character,
      key: LogicalKeyboardKey.keyL,
    ),
    KeyboardKeyModel(
      label: ';',
      type: KeyType.character,
      key: LogicalKeyboardKey.semicolon,
    ),
    KeyboardKeyModel(
      label: "'",
      type: KeyType.character,
      key: LogicalKeyboardKey.quote,
    ),
    KeyboardKeyModel(
      label: 'return',
      type: KeyType.special,
      width: 1.78125,
      key: LogicalKeyboardKey.enter,
    ),
  ],

  // Row 5 (ZXCV row)
  <KeyboardKeyModel>[
    KeyboardKeyModel(
      label: 'shift',
      type: KeyType.special,
      width: 2.3125,
      key: LogicalKeyboardKey.shiftLeft,
    ),
    KeyboardKeyModel(
      label: 'Z',
      type: KeyType.character,
      key: LogicalKeyboardKey.keyZ,
    ),
    KeyboardKeyModel(
      label: 'X',
      type: KeyType.character,
      key: LogicalKeyboardKey.keyX,
    ),
    KeyboardKeyModel(
      label: 'C',
      type: KeyType.character,
      key: LogicalKeyboardKey.keyC,
    ),
    KeyboardKeyModel(
      label: 'V',
      type: KeyType.character,
      key: LogicalKeyboardKey.keyV,
    ),
    KeyboardKeyModel(
      label: 'B',
      type: KeyType.character,
      key: LogicalKeyboardKey.keyB,
    ),
    KeyboardKeyModel(
      label: 'N',
      type: KeyType.character,
      key: LogicalKeyboardKey.keyN,
    ),
    KeyboardKeyModel(
      label: 'M',
      type: KeyType.character,
      key: LogicalKeyboardKey.keyM,
    ),
    KeyboardKeyModel(
      label: ',',
      type: KeyType.character,
      key: LogicalKeyboardKey.comma,
    ),
    KeyboardKeyModel(
      label: '.',
      type: KeyType.character,
      key: LogicalKeyboardKey.period,
    ),
    KeyboardKeyModel(
      label: '/',
      type: KeyType.character,
      key: LogicalKeyboardKey.slash,
    ),
    KeyboardKeyModel(
      label: 'shift',
      type: KeyType.special,
      width: 2.3125,
      key: LogicalKeyboardKey.shiftRight,
    ),
  ],

  // Row 6 (Bottom row)
  <KeyboardKeyModel>[
    KeyboardKeyModel(
      label: 'fn',
      type: KeyType.special,
      key: LogicalKeyboardKey.fn,
    ),
    KeyboardKeyModel(
      label: 'control',
      type: KeyType.special,
      key: LogicalKeyboardKey.controlLeft,
    ),
    KeyboardKeyModel(
      label: 'option',
      type: KeyType.special,
      key: LogicalKeyboardKey.altLeft,
    ),
    KeyboardKeyModel(
      label: 'command',
      type: KeyType.special,
      width: 1.25,
      key: LogicalKeyboardKey.metaLeft,
    ),
    KeyboardKeyModel(
      label: '',
      type: KeyType.special,
      width: 5.25,
      key: LogicalKeyboardKey.space,
    ),
    KeyboardKeyModel(
      label: 'command',
      type: KeyType.special,
      width: 1.25,
      key: LogicalKeyboardKey.metaRight,
    ),
    KeyboardKeyModel(
      label: 'option',
      type: KeyType.special,
      key: LogicalKeyboardKey.altRight,
    ),
    KeyboardKeyModel(
      label: '←',
      type: KeyType.special,
      key: LogicalKeyboardKey.arrowLeft,
    ),
    // KeyboardKeyModel(label: '↑', type: KeyType.special, width: 1, key: LogicalKeyboardKey.arrowUp),
    KeyboardKeyModel(
      label: '↓',
      type: KeyType.special,
      key: LogicalKeyboardKey.arrowDown,
    ),
    KeyboardKeyModel(
      label: '→',
      type: KeyType.special,
      key: LogicalKeyboardKey.arrowRight,
    ),
  ],
];

final List<List<KeyboardKeyModel>> navigationKeys = <List<KeyboardKeyModel>>[
  <KeyboardKeyModel>[
    KeyboardKeyModel(
      label: 'Insert',
      type: KeyType.special,
      key: LogicalKeyboardKey.insert,
    ),
    KeyboardKeyModel(
      label: 'Home',
      type: KeyType.special,
      key: LogicalKeyboardKey.home,
    ),
    KeyboardKeyModel(
      label: 'Page \nUp',
      type: KeyType.special,
      key: LogicalKeyboardKey.pageUp,
    ),
  ],
  <KeyboardKeyModel>[
    KeyboardKeyModel(
      label: 'Delete',
      type: KeyType.special,
      key: LogicalKeyboardKey.delete,
    ),
    KeyboardKeyModel(
      label: 'End',
      type: KeyType.special,
      key: LogicalKeyboardKey.end,
    ),
    KeyboardKeyModel(
      label: 'Page \nDown',
      type: KeyType.special,
      key: LogicalKeyboardKey.pageDown,
    ),
  ],
];

final List<List<KeyboardKeyModel>> arrowKeys = <List<KeyboardKeyModel>>[
  <KeyboardKeyModel>[
    KeyboardKeyModel(
      label: '↑',
      type: KeyType.special,
      key: LogicalKeyboardKey.arrowUp,
    ),
  ],
  <KeyboardKeyModel>[
    KeyboardKeyModel(
      label: '←',
      type: KeyType.special,
      key: LogicalKeyboardKey.arrowLeft,
    ),
    KeyboardKeyModel(
      label: '↓',
      type: KeyType.special,
      key: LogicalKeyboardKey.arrowDown,
    ),
    KeyboardKeyModel(
      label: '→',
      type: KeyType.special,
      key: LogicalKeyboardKey.arrowRight,
    ),
  ],
];

final List<List<KeyboardKeyModel>> keyboardLayout = <List<KeyboardKeyModel>>[
  <KeyboardKeyModel>[
    KeyboardKeyModel(
      label: 'Print \nScreen',
      type: KeyType.special,
      key: LogicalKeyboardKey.printScreen,
    ),
    KeyboardKeyModel(
      label: 'Scroll \nLock',
      type: KeyType.special,
      key: LogicalKeyboardKey.scrollLock,
    ),
  ],
  <KeyboardKeyModel>[
    KeyboardKeyModel(
      label: 'Num \nLock',
      type: KeyType.special,
      key: LogicalKeyboardKey.numLock,
    ),
    KeyboardKeyModel(
      label: '\u00F7',
      type: KeyType.character,
      key: LogicalKeyboardKey.numpadDivide,
    ),
    KeyboardKeyModel(
      label: '\u00D7',
      type: KeyType.character,
      key: LogicalKeyboardKey.numpadMultiply,
    ),
  ],
  <KeyboardKeyModel>[
    KeyboardKeyModel(
      label: '7',
      type: KeyType.character,
      key: LogicalKeyboardKey.numpad7,
    ),
    KeyboardKeyModel(
      label: '8',
      type: KeyType.character,
      key: LogicalKeyboardKey.numpad8,
    ),
    KeyboardKeyModel(
      label: '9',
      type: KeyType.character,
      key: LogicalKeyboardKey.numpad9,
    ),
  ],
  <KeyboardKeyModel>[
    KeyboardKeyModel(
      label: '4',
      type: KeyType.character,
      key: LogicalKeyboardKey.numpad4,
    ),
    KeyboardKeyModel(
      label: '5',
      type: KeyType.character,
      key: LogicalKeyboardKey.numpad5,
    ),
    KeyboardKeyModel(
      label: '6',
      type: KeyType.character,
      key: LogicalKeyboardKey.numpad6,
    ),
  ],
  <KeyboardKeyModel>[
    KeyboardKeyModel(
      label: '1',
      type: KeyType.character,
      key: LogicalKeyboardKey.numpad1,
    ),
    KeyboardKeyModel(
      label: '2',
      type: KeyType.character,
      key: LogicalKeyboardKey.numpad2,
    ),

    KeyboardKeyModel(
      label: '3',
      type: KeyType.character,
      key: LogicalKeyboardKey.numpad3,
    ),
  ],
  <KeyboardKeyModel>[
    KeyboardKeyModel(
      label: '0',
      type: KeyType.character,
      key: LogicalKeyboardKey.numpad0,
      width: 2.0625,
    ),
    KeyboardKeyModel(
      label: '.',
      type: KeyType.character,
      key: LogicalKeyboardKey.numpadDecimal,
    ),
  ],
];

final List<KeyboardKeyModel> lastColumnKeys = <KeyboardKeyModel>[
  KeyboardKeyModel(
    label: 'Pause',
    type: KeyType.special,
    key: LogicalKeyboardKey.pause,
  ),
  KeyboardKeyModel(
    label: '-',
    type: KeyType.character,
    key: LogicalKeyboardKey.numpadSubtract,
  ),
  KeyboardKeyModel(
    label: '+',
    type: KeyType.character,
    key: LogicalKeyboardKey.numpadAdd,
    width: 2.0625,
  ),

  KeyboardKeyModel(
    label: 'Enter',
    type: KeyType.special,
    key: LogicalKeyboardKey.enter,
    width: 2.0625,
  ),
];
