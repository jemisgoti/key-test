import 'package:flutter/material.dart';
import 'package:flutter_keyboard/utils.dart';

class KeyboardToolbar extends StatefulWidget {
  final void Function(KeyStyle os) onPlatformChanged;
  final void Function(KeyboardStyle layout) onLayoutChanged;
  final void Function(KeyboardTestType type) onTestChanged;
  final void Function(bool on) onSoundToggle;
  final VoidCallback onReset;
  final bool soundOn;

  const KeyboardToolbar({
    super.key,
    required this.onPlatformChanged,
    required this.onLayoutChanged,
    required this.onTestChanged,
    required this.onSoundToggle,
    required this.onReset,
    required this.soundOn,
  });

  @override
  State<KeyboardToolbar> createState() => _KeyboardToolbarState();
}

class _KeyboardToolbarState extends State<KeyboardToolbar> {
  KeyStyle selectedOS = KeyStyle.macos;
  KeyboardStyle selectedLayout = KeyboardStyle.full;
  KeyboardTestType selectedTest = KeyboardTestType.typing;
  late bool soundOn;

  @override
  void initState() {
    soundOn = widget.soundOn;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),

      child: Row(
        children: [
          _enumDropdown<KeyStyle>(
            label: 'OS',
            value: selectedOS,
            values: KeyStyle.values,
            onChanged: (value) {
              setState(() => selectedOS = value!);
              widget.onPlatformChanged(value!);
            },
          ),
          const SizedBox(width: 12),
          _enumDropdown<KeyboardStyle>(
            label: 'Layout',
            value: selectedLayout,
            values: KeyboardStyle.values,
            onChanged: (value) {
              setState(() => selectedLayout = value!);
              widget.onLayoutChanged(value!);
            },
          ),
          const SizedBox(width: 12),
          _enumDropdown<KeyboardTestType>(
            label: 'Test Type',
            value: selectedTest,
            values: KeyboardTestType.values,
            onChanged: (value) {
              setState(() => selectedTest = value!);
              widget.onTestChanged(value!);
            },
          ),
          const Spacer(),
          Row(
            children: [
              const Text('Sound:'),
              Transform.scale(
                scale: 0.8,
                child: Switch.adaptive(
                  mouseCursor: SystemMouseCursors.click,
                  value: soundOn,

                  onChanged: (value) {
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
          ),
        ],
      ),
    );
  }

  Widget _enumDropdown<T extends Enum>({
    required String label,
    required T value,
    required List<T> values,
    required ValueChanged<T?> onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(width: 1, color: Colors.black26),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      height: 36,
      child: Row(
        children: [
          DropdownButton<T>(
            value: value,
            underline: SizedBox(),
            isDense: true,
            padding: EdgeInsets.zero,
            items:
                values
                    .map(
                      (e) => DropdownMenuItem<T>(
                        value: e,

                        child: Text(
                          e.uiName,
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                      ),
                    )
                    .toList(),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
