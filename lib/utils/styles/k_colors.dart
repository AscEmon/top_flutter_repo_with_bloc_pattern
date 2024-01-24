import 'package:flutter/material.dart';

enum KColor {
  primary,
  secondary,
  accent,
  red,
  white,
  black,
  grey,
  divider,
  fill,
  transparent,
  enableBorder,
  fromText,
  statusBar,
  formtextFill,
  dashBack,
}

extension KColorExtention on KColor {
  Color get color {
    switch (this) {
      case KColor.primary:
        return Colors.blue;
      case KColor.secondary:
        return const Color(0xff5EA7FF);
      case KColor.accent:
        return Colors.blue;
      case KColor.red:
        return const Color(0xffE42B2B);
      case KColor.grey:
        return const Color.fromARGB(255, 157, 157, 157);
      case KColor.black:
        return Colors.black;
      case KColor.divider:
        return const Color(0xffE6E6E6);
      case KColor.enableBorder:
        return const Color(0xffE0E0E0);
      case KColor.fill:
        return const Color.fromARGB(255, 247, 246, 246);
      case KColor.fromText:
        return const Color(0xff7B7A7A);
      case KColor.white:
        return Colors.white;
      case KColor.statusBar:
        return const Color(0xff3E95FF);
      case KColor.transparent:
        return Colors.transparent;
      case KColor.formtextFill:
        return const Color(0xffFCFCFC);

      case KColor.dashBack:
        return const Color(0xffF8F8F8);

      default:
        return Colors.blue;
    }
  }
}
