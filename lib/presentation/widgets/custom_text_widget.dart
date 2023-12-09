import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final bool isBold;
  final bool alignCenter;
  final Color? textColor;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final TextDecoration? textDecoration;

  const CustomText(
      {super.key,
      required this.text,
      this.size = 16,
      this.isBold = false,
      this.alignCenter = false,
      this.fontWeight,
      this.fontStyle,
      this.textDecoration,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: alignCenter ? TextAlign.center : null,
      style: TextStyle(
          decoration: textDecoration,
          fontSize: size,
          fontStyle: fontStyle,
          fontWeight:
              fontWeight ?? (isBold ? FontWeight.bold : FontWeight.normal),
          color: textColor),
    );
  }
}
