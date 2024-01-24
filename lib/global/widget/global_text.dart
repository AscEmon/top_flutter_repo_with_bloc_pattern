import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/constant/constant_key.dart';

class GlobalText extends StatelessWidget {
  final String str;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? color;
  final FontStyle? fontStyle;
  final double? letterSpacing;
  final TextDecoration? decoration;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final bool? softwrap;
  final double? height;
  final String? fontFamily;
  final TextStyle? style;

  const GlobalText({
    Key? key,
    required this.str,
    this.fontWeight,
    this.fontSize,
    this.fontStyle,
    this.color,
    this.letterSpacing,
    this.decoration,
    this.maxLines,
    this.textAlign,
    this.overflow,
    this.softwrap,
    this.height,
    this.fontFamily,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      str,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      softWrap: softwrap,
      style: style ??
          TextStyle(
            color: color ?? Colors.black,
            fontSize: fontSize?.sp,
            fontWeight: fontWeight ?? FontWeight.w500,
            letterSpacing: letterSpacing,
            decoration: decoration,
            height: height,
            fontStyle: fontStyle,
            fontFamily: fontFamily ?? AppConstant.FONTFAMILY.key,
          ),
    );
  }
}
