import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard/keyboard_service.dart';
import 'package:flutter_keyboard/main.dart';

/// A widget that displays currently pressed keys,
/// used for anti-ghosting tests.
class AntiGhostingDetails extends StatefulWidget {
  /// Creates the anti-ghosting widget to monitor key presses.
  const AntiGhostingDetails({required this.keyboardService, super.key});

  /// The keyboard service providing key press updates.
  final KeyboardService keyboardService;

  @override
  State<AntiGhostingDetails> createState() => _AntiGhostingDetailsState();
}

/// State class for [AntiGhostingDetails].
class _AntiGhostingDetailsState extends State<AntiGhostingDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(12),
      height: 48,
      decoration: BoxDecoration(
        color: theme.containerColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: StreamBuilder<Set<LogicalKeyboardKey>>(
        stream: widget.keyboardService.streamController.stream,
        builder: (
          BuildContext context,
          AsyncSnapshot<Set<LogicalKeyboardKey>> snapshot,
        ) {
          final Set<LogicalKeyboardKey> keys =
              snapshot.data ?? <LogicalKeyboardKey>{};

          return Row(
            children: <Widget>[
              /// Display count of currently pressed keys
              Text('${keys.length} Keys'),

              /// Divider between key count and key list
              VerticalDivider(
                color: theme.colorScheme.primary,
                width: 16,
                thickness: 2,
              ),

              /// Display list of currently pressed keys
              Expanded(
                child: Wrap(
                  children:
                      keys
                          .map(
                            (LogicalKeyboardKey e) => Container(
                              margin: const EdgeInsets.only(right: 8),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 7,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: theme.colorScheme.primary,
                                ),
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: Text(e.keyLabel),
                            ),
                          )
                          .toList(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
