import 'package:flutter/painting.dart';

extension DeflateExtensions on Rect {
  Rect deflateWithEdgeInsets(EdgeInsets margin) {
    return Rect.fromLTRB(
      left + margin.left,
      top + margin.top,
      right - margin.right,
      bottom - margin.bottom,
    );
  }
}
