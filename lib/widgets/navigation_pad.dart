 
import 'package:flutter/material.dart';
import 'package:flutter_keyboard/utils/key_layout.dart';
import 'package:flutter_keyboard/utils/key_type.dart';
import 'package:flutter_keyboard/utils/utils.dart';
import 'package:flutter_keyboard/widgets/key_widget.dart';

/// A widget that visually represents the navigation pad section of
/// a full-sized keyboard.
///
/// Includes keys like Insert, Delete, Home, End, PageUp, PageDown, and
/// directional arrow keys (↑ ↓ ← →). Each key provides visual feedback
/// and triggers callbacks on press and release.
class NavigationPad extends StatelessWidget {
  /// Creates a [NavigationPad] widget.
  ///
  /// - [width]: The width for individual keys.
  /// - [gap]: The spacing between keys.
  /// - [onKeyPress]: Callback when a key is pressed.
  /// - [onKeyRelease]: Callback when a key is released.
  /// - [keyboardTestType]: The current test mode (e.g., typing, key test).
  const NavigationPad({
    required this.width,
    required this.gap,
    required this.onKeyRelease,
    required this.onKeyPress,
    required this.keyboardTestType,
    super.key,
  });

  /// Width for a single key unit.
  final double width;

  /// Spacing between keys (horizontal and vertical).
  final double gap;

  /// Called when a key is pressed.
  final void Function(KeyboardKeyModel keyModel) onKeyPress;

  /// Called when a key is released.
  final void Function(KeyboardKeyModel keyModel) onKeyRelease;

  /// Type of test currently being performed.
  final KeyboardTestType keyboardTestType;

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      // Top padding (placeholder alignment)
      SizedBox(height: width),
      SizedBox(height: gap),

      // Navigation keys (Insert, Delete, Home, End, etc.)
      Column(
        mainAxisSize: MainAxisSize.min,
        children:
            navigationKeys
                .map(
                  (List<KeyboardKeyModel> row) => Container(
                    height: width,
                    margin: EdgeInsets.only(bottom: gap),
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: row.length,
                      itemBuilder: (BuildContext context, int index) {
                        final KeyboardKeyModel keyModel = row[index];
                        return SizedBox(
                          width: width * keyModel.width,
                          child: KeyboardKeyWidget(
                            keyModel: keyModel,
                            keyboardTestType: keyboardTestType,
                            onKeyPress: () => _onKeyPress(keyModel),
                            onKeyRelease: () => _onKeyRelease(keyModel),
                          ),
                        );
                      },
                      separatorBuilder: (_, __) => SizedBox(width: gap),
                    ),
                  ),
                )
                .toList(),
      ),

      SizedBox(height: gap),
      SizedBox(height: width),

      // Arrow keys (↑ ↓ ← →)
      Column(
        mainAxisSize: MainAxisSize.min,
        children:
            arrowKeys
                .map(
                  (List<KeyboardKeyModel> row) => Container(
                    height: width,
                    margin: EdgeInsets.only(bottom: gap),
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: row.length,
                      itemBuilder: (BuildContext context, int index) {
                        final KeyboardKeyModel keyModel = row[index];
                        return SizedBox(
                          width: width * keyModel.width,
                          child: KeyboardKeyWidget(
                            keyModel: keyModel,
                            keyboardTestType: keyboardTestType,
                            onKeyPress: () => _onKeyPress(keyModel),
                            onKeyRelease: () => _onKeyRelease(keyModel),
                          ),
                        );
                      },
                      separatorBuilder: (_, __) => SizedBox(width: gap),
                    ),
                  ),
                )
                .toList(),
      ),
    ],
  );

  /// Internal press handler to trigger [onKeyPress].
  void _onKeyPress(KeyboardKeyModel keyModel) => onKeyPress.call(keyModel);

  /// Internal release handler to trigger [onKeyRelease].
  void _onKeyRelease(KeyboardKeyModel keyModel) => onKeyRelease.call(keyModel);
}
