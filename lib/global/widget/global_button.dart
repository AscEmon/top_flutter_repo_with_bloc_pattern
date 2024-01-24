import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_flutter_repo/global/widget/global_text.dart';

import '../../utils/styles/styles.dart';

class GlobalButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String buttonText;
  final bool isRounded;
  final double? btnHeight;
  final int roundedBorderRadius;
  final Color? btnBackgroundActiveColor;
  final double? textFontSize;

  GlobalButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
    this.isRounded = true,
    this.btnHeight,
    this.roundedBorderRadius = 17,
    this.btnBackgroundActiveColor,
    this.textFontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color btnColor = btnBackgroundActiveColor ?? KColor.accent.color;

    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
          (states) {
            return RoundedRectangleBorder(
              borderRadius: isRounded
                  ? BorderRadius.circular(
                      roundedBorderRadius.r,
                    )
                  : BorderRadius.zero,
            );
          },
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) =>
              onPressed != null ? btnColor : KColor.divider.color,
        ),
        elevation: MaterialStateProperty.resolveWith(
          (states) => 0.0,
        ),
      ),
      onPressed: onPressed,
      child: SizedBox(
        height: btnHeight ?? 76.h,
        child: Center(
          child: GlobalText(
            str: buttonText,
            fontWeight: FontWeight.w500,
            fontSize: textFontSize ?? 14,
            color: KColor.white.color,
          ),
        ),
      ),
    );
  }
}



 