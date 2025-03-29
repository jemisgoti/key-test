import 'package:flutter/material.dart';
import 'package:flutter_keyboard/key_type.dart';

class KeyboardKeyWidget extends StatefulWidget {
  final KeyboardKeyModel keyModel;
  final VoidCallback onPressed;
  final VoidCallback onMouseDown;

  const KeyboardKeyWidget({
    super.key,
    required this.keyModel,
    required this.onPressed,
    required this.onMouseDown,
  });

  @override
  State<KeyboardKeyWidget> createState() => _KeyboardKeyWidgetState();
}

class _KeyboardKeyWidgetState extends State<KeyboardKeyWidget> {
  late KeyboardKeyModel keyModel;
  @override
  void initState() {
    keyModel = widget.keyModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTapDown: (_) async {
          widget.onPressed.call();
          setState(() {
            keyModel.isPressed = true;
          });
          await Future.delayed(Durations.short2);
          setState(() {
            keyModel.isPressed = false;
          });
        },
        onLongPress: widget.onMouseDown,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          margin: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: _getKeyColor(keyModel),
            borderRadius: BorderRadius.circular(4),
            boxShadow:
                keyModel.isPressed
                    ? []
                    : [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 3),
                        blurRadius: 4,
                      ),
                    ],
            border: Border.all(color: Colors.grey.shade300, width: 1),
          ),
          transform:
              keyModel.isPressed
                  ? Matrix4.translationValues(0, 2, 0)
                  : Matrix4.identity(),
          child: Center(
            child: Text(
              keyModel.label ,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: _getTextColor(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _getKeyColor(keyModel) {
    if (keyModel.isPressed) {
      return Colors.grey.shade700;
    }
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

  Color _getTextColor() {
    return keyModel.isPressed ? Colors.white : Colors.black87;
  }
}
