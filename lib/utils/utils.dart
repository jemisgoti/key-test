/// Represents the platform-specific keyboard style.
enum KeyStyle {
  /// Apple MacOS keyboard layout.
  macos,

  /// Microsoft Windows keyboard layout.
  windows,
}

/// Represents the physical layout of the keyboard.
enum KeyboardStyle {
  /// Full keyboard with numpad and function keys.
  full,

  /// Ten keyless keyboard (no numpad).
  tenKeyLess,

  /// Compact 60% keyboard layout.
  sixtyPercent,
}

/// Represents the type of keyboard test being performed.
enum KeyboardTestType {
  /// Normal typing experience.
  typing,

  /// Anti-ghosting test to check multiple key inputs.
  antiGhosting,

  /// Key tester to validate individual key inputs.
  keyTest,
}

/// Adds human-readable labels for enums used in the UI.
extension EnumLabelExtension on Enum {
  /// Returns a user-friendly string to display in the UI.
  String get uiName {
    switch (this) {
      case KeyStyle.macos:
        return 'MacOS';
      case KeyStyle.windows:
        return 'Windows';

      case KeyboardStyle.full:
        return 'Full';
      case KeyboardStyle.tenKeyLess:
        return 'Ten Keyless';
      case KeyboardStyle.sixtyPercent:
        return '60%';

      case KeyboardTestType.typing:
        return 'Normal Typing';
      case KeyboardTestType.antiGhosting:
        return 'Anti-Ghosting Test';
      case KeyboardTestType.keyTest:
        return 'Key Tester';
    }

    // Fallback in case a new enum value is added in the future.
    return name;
  }
}
