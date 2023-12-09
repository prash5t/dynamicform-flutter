import 'package:flutter/material.dart';

extension NumExtensions on num {
  /// Provide height and it returns SizedBox with that height.
  /// Can be used in multiple places where vertical gap/space of custom height is needed
  /// Adjusted with ScreenUtil .h
  toHGap() => SizedBox(height: toDouble());

  /// Provide width and it returns SizedBox with that provided width.
  /// Can be used in multiple places where horizontal gap/space of custom width is needed.
  /// Adjusted with ScreenUtil .w
  toWGap() => SizedBox(width: toDouble());
}
