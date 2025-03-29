import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard/key_layout.dart';
import 'package:flutter_keyboard/key_type.dart';
import 'package:flutter_keyboard/key_widget.dart';

class MacOs extends StatelessWidget {
  const MacOs({super.key, required this.onMouseDown, required this.onPressed});
  final Function(KeyboardKeyModel keyboardKeyModel) onPressed;
  final Function(KeyboardKeyModel keyboardKeyModel) onMouseDown;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var width = constraints.biggest.width;
        double gap = (4 / 1448) * width;
        log(gap.toString());

        return Column(
          mainAxisSize: MainAxisSize.min,
          children:
              macKeyboardLayout.map((row) {
                double keysWdith = width - gap * (row.length - 1);
                double keyWidth =
                    keysWdith /
                    (row
                        .map((e) => e.width)
                        .reduce((value, element) => value + element));

                return Container(
                  height: keyWidth,
                  width: width,
                  margin: EdgeInsets.only(bottom: gap),
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var keyModel = row[index];
                      return SizedBox(
                        width: keyWidth * keyModel.width,
                        child: KeyboardKeyWidget(
                          keyModel: keyModel,
                          onPressed: () {
                            onPressed.call(keyModel);
                          },
                          onMouseDown: () {
                            onMouseDown.call(keyModel);
                          },
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(width: gap),
                    itemCount: row.length,
                  ),
                );
              }).toList(),
        );
      },
    );
  }
}
