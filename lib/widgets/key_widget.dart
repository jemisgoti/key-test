import 'package:flutter/material.dart';
import 'package:flutter_keyboard/utils/key_type.dart';
import 'package:flutter_keyboard/utils/utils.dart';

/// A widget representing an individual keyboard key.
///
/// Reacts visually when pressed or released and calls appropriate
/// callbacks for interaction tracking.
class KeyboardKeyWidget extends StatelessWidget {
  /// Creates a key widget with visual and functional behavior.
  const KeyboardKeyWidget({
    required this.keyModel,
    required this.onKeyPress,
    required this.onKeyRelease,
    required this.keyboardTestType,
    super.key,
  });

  /// The model containing key data like label, width, type.
  final KeyboardKeyModel keyModel;

  /// Callback triggered when key is pressed.
  final VoidCallback onKeyPress;

  /// Callback triggered when key is released.
  final VoidCallback onKeyRelease;

  /// Type of keyboard test mode this key is rendered for.
  final KeyboardTestType keyboardTestType;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return ValueListenableBuilder<bool>(
      valueListenable: keyModel.isPressed,
      builder:
          (BuildContext context, bool isPressed, Widget? child) => MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTapDown: (_) => onKeyPress.call(),
              onTapUp: (_) => onKeyRelease.call(),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  gradient:
                      isPressed
                          ? LinearGradient(
                            colors: <Color>[
                              theme.colorScheme.primary,
                              theme.colorScheme.primary,
                            ],
                          )
                          : LinearGradient(
                            colors: <Color>[
                              theme.colorScheme.primaryContainer,
                              theme.colorScheme.secondaryContainer,
                            ],
                          ),
                  boxShadow: _getBoxShadow(isPressed),
                  border: Border(
                    bottom: BorderSide(
                      color: theme.colorScheme.primary.withValues(alpha: 0.25),
                      width: 2,
                    ),
                    right: BorderSide(
                      color: theme.colorScheme.primary.withValues(alpha: 0.25),
                      width: 2,
                    ),
                    left: BorderSide(
                      color: theme.colorScheme.primary.withValues(alpha: 0.25),
                      width: 0.75,
                    ),
                    top: BorderSide(
                      color: theme.colorScheme.primary.withValues(alpha: 0.25),
                      width: 0.52,
                    ),
                  ),
                ),
                transform:
                    isPressed
                        ? Matrix4.translationValues(0, 2, 0)
                        : Matrix4.identity(),
                child: Center(
                  child: Text(
                    keyModel.label,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: _getTextColor(isPressed, theme),
                    ),
                  ),
                ),
              ),
            ),
          ),
    );
  }

  /// Returns a color based on key type and pressed state.
  Color _getKeyColor(KeyboardKeyModel keyModel, bool isPressed) {
    if (isPressed) return Colors.grey.shade700;

    switch (keyModel.type) {
      case KeyType.modifier:
        return Colors.grey.shade200;
      case KeyType.special:
        return Colors.grey.shade100;
      case KeyType.function:
        return Colors.green.shade100;
      default:
        return Colors.white;
    }
  }

  /// Provides shadow styling based on press state.
  List<BoxShadow> _getBoxShadow(bool isPressed) =>
      isPressed
          ? <BoxShadow>[
            const BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 1),
              blurRadius: 1,
            ),
          ]
          : <BoxShadow>[
            const BoxShadow(
              color: Colors.black26,
              offset: Offset(0.5, 1),
              blurRadius: 2,
            ),
          ];

  /// Gets the text color depending on pressed state.
  Color _getTextColor(bool isPressed, ThemeData theme) =>
      isPressed
          ? theme.colorScheme.primaryContainer
          : theme.colorScheme.primary;
}
