enum KeyType { character, modifier, function, special }

class KeyboardKeyModel {
  final String label;
  final KeyType type;
  final double width;
  bool isPressed = false;

  KeyboardKeyModel({required this.label, required this.type, this.width = 1.0});
}
