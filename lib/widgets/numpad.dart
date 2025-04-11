import 'package:flutter/material.dart';
import 'package:flutter_keyboard/utils/key_layout.dart';
import 'package:flutter_keyboard/utils/key_type.dart';
import 'package:flutter_keyboard/utils/utils.dart';
import 'package:flutter_keyboard/widgets/key_widget.dart';

/// A widget that visually represents a numeric keypad (numpad) keyboard layout.
///
/// The `NumpadKeyboard` is typically used to simulate or test key interactions
/// for a numeric keypad. It displays rows of keys and a separate final column
/// (e.g., for Enter or large keys), and supports visual feedback and callbacks
/// for key press and release events.
class NumpadKeyboard extends StatelessWidget {
  /// Creates a new instance of the [NumpadKeyboard] widget.
  ///
  /// The [width] determines the base size of each key,
  /// while [gap] defines the spacing between keys.
  ///
  /// [onKeyPress] and [onKeyRelease] are invoked when a key is pressed
  /// or released, respectively. The [keyboardTestType] is used to
  /// determine the testing mode (e.g., typing, anti-ghosting).
  const NumpadKeyboard({
    required this.width,
    required this.gap,
    required this.onKeyRelease,
    required this.onKeyPress,
    required this.keyboardTestType,
    super.key,
  });

  /// Callback triggered when a key is pressed.
  final void Function(KeyboardKeyModel keyboardKeyModel) onKeyPress;

  /// Callback triggered when a key is released.
  final void Function(KeyboardKeyModel keyboardKeyModel) onKeyRelease;

  /// The width of a single key unit; used to scale keys proportionally.
  final double width;

  /// The spacing between individual keys in the layout.
  final double gap;

  /// Defines the current test type (e.g., typing, key test, anti-ghosting).
  final KeyboardTestType keyboardTestType;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      // Left block: main keypad layout (rows of keys)
      Column(
        mainAxisSize: MainAxisSize.min,
        children:
            keyboardLayout
                .map(
                  (List<KeyboardKeyModel> row) => Container(
                    height: width,
                    margin: EdgeInsets.only(bottom: gap),
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        final KeyboardKeyModel keyModel = row[index];
                        return SizedBox(
                          width: width * keyModel.width,
                          child: KeyboardKeyWidget(
                            keyModel: keyModel,
                            keyboardTestType: keyboardTestType,
                            onKeyPress: () => onKeyPress.call(keyModel),
                            onKeyRelease: () => onKeyRelease.call(keyModel),
                          ),
                        );
                      },
                      separatorBuilder:
                          (BuildContext context, int index) =>
                              SizedBox(width: gap),
                      itemCount: row.length,
                    ),
                  ),
                )
                .toList(),
      ),

      SizedBox(width: gap),

      // Right block: the last column (e.g., Enter, large keys)
      Column(
        mainAxisSize: MainAxisSize.min,
        children:
            lastColumnKeys
                .map(
                  (KeyboardKeyModel keyModel) => Container(
                    margin: EdgeInsets.only(bottom: gap),
                    height: width * keyModel.width,
                    width: width,
                    child: KeyboardKeyWidget(
                      keyModel: keyModel,
                      keyboardTestType: keyboardTestType,
                      onKeyPress: () => onKeyPress.call(keyModel),
                      onKeyRelease: () => onKeyRelease.call(keyModel),
                    ),
                  ),
                )
                .toList(),
      ),
    ],
  );
}
