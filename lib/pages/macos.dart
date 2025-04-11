import 'package:flutter/material.dart';
import 'package:flutter_keyboard/keyboard_service.dart';
import 'package:flutter_keyboard/utils/key_type.dart';
import 'package:flutter_keyboard/widgets/key_widget.dart';

/// A widget representing the macOS-style keyboard layout.
///
/// This builds a visual layout using the provided [KeyboardService]
/// and handles key press/release events through callbacks.
class MacOs extends StatelessWidget {
  /// Creates a [MacOs] keyboard layout widget.
  ///
  /// Requires [keyboardService] to provide the layout and behavior,
  /// as well as [onKeyPress] and [onKeyRelease] callbacks.
  const MacOs({
    required this.keyboardService,
    required this.onKeyPress,
    required this.onKeyRelease,
    super.key,
  });

  /// Callback invoked when a key is released.
  final void Function(KeyboardKeyModel keyboardKeyModel) onKeyRelease;

  /// Callback invoked when a key is pressed.
  final void Function(KeyboardKeyModel keyboardKeyModel) onKeyPress;

  /// Service providing layout and test mode settings.
  final KeyboardService keyboardService;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (BuildContext context, BoxConstraints constraints) {
      final double width = constraints.biggest.width;
      double keyWidth = 72 * width / 1103;
      keyWidth = keyWidth > 72 ? 72 : keyWidth;
      final double gap = keyWidth / 16;
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
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
                          scrollDirection: Axis.horizontal,
                          itemCount: row.length,
                          itemBuilder: (BuildContext context, int index) {
                            final KeyboardKeyModel keyModel = row[index];
                            return SizedBox(
                              width: keyWidth * keyModel.width,
                              height: keyWidth,
                              child: KeyboardKeyWidget(
                                keyModel: keyModel,
                                onKeyPress: () {
                                  onKeyPress.call(keyModel);
                                },
                                onKeyRelease: () {
                                  onKeyRelease.call(keyModel);
                                },
                                keyboardTestType:
                                    keyboardService.keyboardTestType,
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
        ],
      );
    },
  );
}
