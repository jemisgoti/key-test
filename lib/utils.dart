enum KeyStyle { macos, windows }

enum KeyboardStyle { full, tenKeyLess, sixtyPercent }

enum KeyboardTestType { typing, antiGhosting, keyTest }

extension EnumLabelExtension on Enum {
  String get uiName {
    switch (this) {
      case KeyStyle.macos:
        return 'MacOS';
      case KeyStyle.windows:
        return 'Windows';

      case KeyboardStyle.full:
        return 'Full';
      case KeyboardStyle.tenKeyLess:
        return 'Tenkeyless';
      case KeyboardStyle.sixtyPercent:
        return '60%';

      case KeyboardTestType.typing:
        return 'Typing Test';
      case KeyboardTestType.antiGhosting:
        return 'Anti-Ghosting Test';
      case KeyboardTestType.keyTest:
        return 'Key Tester';
    }

    return name; // fallback, Dart 3+ `name` is available on Enum
  }
}
