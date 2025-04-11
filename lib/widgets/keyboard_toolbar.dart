import 'package:flutter/material.dart';
import 'package:flutter_keyboard/keyboard_service.dart';
import 'package:flutter_keyboard/main.dart';
import 'package:flutter_keyboard/providers/theme_provide.dart';
import 'package:flutter_keyboard/utils/utils.dart';
import 'package:provider/provider.dart';

/// A toolbar widget for controlling the keyboard test UI.
///
/// Allows changing platform (Mac/Windows), layout (e.g. 60%, TKL),
/// test mode (typing, anti-ghosting, etc), theme, sound, and reset.
class KeyboardToolbar extends StatefulWidget {
  /// Creates a toolbar widget for changing functional behavior.
  const KeyboardToolbar({
    required this.keyboardService,
    required this.onPlatformChanged,
    required this.onLayoutChanged,
    required this.onTestChanged,
    required this.onSoundToggle,
    required this.onReset,
    super.key,
  });

  /// Callback when the platform (OS) is changed.
  final void Function(KeyStyle os) onPlatformChanged;

  /// Callback when the keyboard layout is changed.
  final void Function(KeyboardStyle layout) onLayoutChanged;

  /// Callback when the test mode is changed.
  final void Function(KeyboardTestType type) onTestChanged;

  /// Callback when the sound toggle is switched.
  final void Function(bool on) onSoundToggle;

  /// Callback to reset the test state.
  final VoidCallback onReset;

  /// Service handling the keyboard logic and state.
  final KeyboardService keyboardService;

  @override
  State<KeyboardToolbar> createState() => _KeyboardToolbarState();
}

class _KeyboardToolbarState extends State<KeyboardToolbar> {
  late KeyStyle keyStyle;
  late KeyboardStyle keyboardStyle;
  late KeyboardTestType keyboardTestType;
  late bool soundOn;

  @override
  void initState() {
    super.initState();
    soundOn = widget.keyboardService.soundEnabled;
    keyStyle = widget.keyboardService.keyStyle;
    keyboardStyle = widget.keyboardService.keyboardStyle;
    keyboardTestType = widget.keyboardService.keyboardTestType;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return Container(
      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: theme.containerColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: LayoutBuilder(
        builder:
            (BuildContext context, BoxConstraints constraints) => Wrap(
              spacing: 12,
              runSpacing: 12,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                _enumDropdown<KeyStyle>(
                  label: 'OS',
                  value: keyStyle,
                  values: KeyStyle.values,
                  onChanged: (KeyStyle? value) {
                    setState(() => keyStyle = value!);
                    widget.onPlatformChanged(value!);
                  },
                ),
                if (keyStyle != KeyStyle.macos)
                  _enumDropdown<KeyboardStyle>(
                    label: 'Layout',
                    value: keyboardStyle,
                    values: KeyboardStyle.values,
                    onChanged: (KeyboardStyle? value) {
                      setState(() => keyboardStyle = value!);
                      widget.onLayoutChanged(value!);
                    },
                  ),
                _enumDropdown<KeyboardTestType>(
                  label: 'Test Type',
                  value: keyboardTestType,
                  values: KeyboardTestType.values,
                  onChanged: (KeyboardTestType? value) {
                    setState(() => keyboardTestType = value!);
                    widget.onTestChanged(value!);
                  },
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Icon(Icons.light_mode),
                    Transform.scale(
                      scale: 0.8,
                      child: Switch(
                        mouseCursor: SystemMouseCursors.click,
                        value: themeProvider.themeMode == ThemeMode.dark,
                        onChanged: (_) => themeProvider.toggleTheme(),
                      ),
                    ),
                    const Icon(Icons.dark_mode),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text('Sound:'),
                    Transform.scale(
                      scale: 0.8,
                      child: Switch(
                        mouseCursor: SystemMouseCursors.click,
                        value: soundOn,
                        onChanged: (bool value) {
                          setState(() => soundOn = value);
                          widget.onSoundToggle(value);
                        },
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: widget.onReset,
                  icon: const Icon(Icons.refresh),
                  tooltip: 'Reset Keyboard State',
                ),
              ],
            ),
      ),
    );
  }

  /// A generic dropdown builder for enums.
  ///
  /// Used to select OS, layout, and test types.
  Widget _enumDropdown<T extends Enum>({
    required String label,
    required T value,
    required List<T> values,
    required ValueChanged<T?> onChanged,
  }) => Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      border: Border.all(
        color: Theme.of(context).primaryColor.withValues(alpha: 0.26),
      ),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    
    child: DropdownButton<T>(
      value: value,
      focusNode: FocusNode(canRequestFocus: false),
      underline: const SizedBox(),
      isDense: true,
      padding: EdgeInsets.zero,
      items:
          values
              .map(
                (T e) => DropdownMenuItem<T>(
                  value: e,
                  child: Text(
                    e.uiName,
                    style: const TextStyle(fontWeight: FontWeight.w300),
                  ),
                ),
              )
              .toList(),
      onChanged: onChanged,
    ),
  );
}
