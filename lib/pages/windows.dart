import 'package:flutter/material.dart';
import 'package:flutter_keyboard/keyboard_service.dart';
import 'package:flutter_keyboard/utils/key_type.dart';
import 'package:flutter_keyboard/utils/utils.dart';
import 'package:flutter_keyboard/widgets/key_widget.dart';
import 'package:flutter_keyboard/widgets/navigation_pad.dart';
import 'package:flutter_keyboard/widgets/numpad.dart';

/// A widget that displays the full Windows keyboard layout.
///
/// This includes the main key grid, navigation pad, and number pad
/// based on the selected [KeyboardStyle].
class WindowsKeyboard extends StatelessWidget {
  /// Creates a [WindowsKeyboard] widget.
  ///
  /// Requires [keyboardService], a key press and key release callback.
  const WindowsKeyboard({
    required this.keyboardService,
    required this.onKeyRelease,
    required this.onKeyPress,
    super.key,
  });

  /// Callback when a key is pressed.
  final void Function(KeyboardKeyModel keyboardKeyModel) onKeyPress;

  /// Callback when a key is released.
  final void Function(KeyboardKeyModel keyboardKeyModel) onKeyRelease;

  /// Reference to the keyboard service providing layout and settings.
  final KeyboardService keyboardService;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (BuildContext context, BoxConstraints constraints) {
      final double keyMaxSize =
          keyboardService.keyboardStyle == KeyboardStyle.sixtyPercent ? 72 : 60;

      final double width = constraints.biggest.width;
      double keyWidth = keyMaxSize * width / 1103;
      keyWidth = keyWidth > keyMaxSize ? keyMaxSize : keyWidth;
      final double gap = keyWidth / 20;
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // Main key layout (alpha rows)
          Column(
            mainAxisSize: MainAxisSize.min,
            children:
                keyboardService.keyboardLayout
                    .map(
                      (List<KeyboardKeyModel> row) => Container(
                        height: keyWidth,
                        margin: EdgeInsets.only(bottom: gap),
                        child: ListView.separated(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          itemCount: row.length,
                          itemBuilder: (BuildContext context, int index) {
                            final KeyboardKeyModel keyModel = row[index];
                            return SizedBox(
                              width: keyWidth * keyModel.width,
                              child: KeyboardKeyWidget(
                                keyModel: keyModel,
                                keyboardTestType:
                                    keyboardService.keyboardTestType,
                                onKeyPress: () {
                                  _onKeyPress(keyModel);
                                },
                                onKeyRelease: () {
                                  _onKeyRelease(keyModel);
                                },
                              ),
                            );
                          },
                          separatorBuilder:
                              (BuildContext context, int index) =>
                                  SizedBox(width: gap),
                        ),
                      ),
                    )
                    .toList(),
          ),

          // Navigation pad (if not 60%)
          if (keyboardService.keyboardStyle != KeyboardStyle.sixtyPercent)
            SizedBox(width: gap * 5),
          if (keyboardService.keyboardStyle != KeyboardStyle.sixtyPercent)
            NavigationPad(
              width: keyWidth,
              keyboardTestType: keyboardService.keyboardTestType,
              gap: gap,
              onKeyPress: _onKeyPress,
              onKeyRelease: _onKeyRelease,
            ),

          // Numpad (only for full layout)
          if (keyboardService.keyboardStyle == KeyboardStyle.full)
            SizedBox(width: gap * 5),
          if (keyboardService.keyboardStyle == KeyboardStyle.full)
            NumpadKeyboard(
              width: keyWidth,
              keyboardTestType: keyboardService.keyboardTestType,
              gap: gap,
              onKeyPress: _onKeyPress,
              onKeyRelease: _onKeyRelease,
            ),
        ],
      );
    },
  );

  /// Internal wrapper for [onKeyPress] callback.
  void _onKeyPress(KeyboardKeyModel keyModel) => onKeyPress.call(keyModel);

  /// Internal wrapper for [onKeyRelease] callback.
  void _onKeyRelease(KeyboardKeyModel keyModel) => onKeyRelease.call(keyModel);
}
