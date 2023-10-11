import 'package:flutter/material.dart';

extension StringNullSafetyExtension on String? {
  bool get hasText => this != null && this!.isNotEmpty;

  String defaultValue(String onNull) {
    return this == null ? onNull : this!;
  }

  String? capitalize() {
    if (this == null) return null;
    return "${this![0].toUpperCase()}${this!.substring(1)}";
  }

  ///Return the number of line required to display all this text.
  int numberOfLine({
    required TextStyle style,
    required double maxWidth,
    TextDirection? textDirection = TextDirection.rtl,
  }) {
    if (this == null && this!.isEmpty) return 0;
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: this, style: style),
      textDirection: TextDirection.rtl,
    )..layout();
    textPainter.layout(maxWidth: maxWidth);

    final TextSelection selection =
        TextSelection(baseOffset: 0, extentOffset: this!.length);
    final List<TextBox> boxes = textPainter.getBoxesForSelection(selection);
    int numberOfLines = 0;
    double currentTop = 0;
    for (int i = 0; i < boxes.length; i++) {
      if (currentTop != boxes[i].top) {
        numberOfLines += 1;
        currentTop = boxes[i].top;
      }
    }
    return numberOfLines;
  }

  ///Return the amount of space required to paint this text.
  Size textSize({
    required TextStyle style,
    TextDirection? textDirection = TextDirection.rtl,
  }) {
    if (this == null && this!.isEmpty) return Size.zero;
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: this, style: style),
      maxLines: 1,
      textDirection: textDirection,
    )..layout();
    return textPainter.size;
  }
}
