import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/global/widget/global_button.dart';
import '/global/widget/global_text.dart';
import '/utils/navigation.dart';
import '/utils/styles/styles.dart';

class ViewUtil {
  static snackbar(
    String msg, {
    String? btnName,
    void Function()? onPressed,
  }) {
    /**
     * Using ScaffoldMessenger we can easily access
     * this snackbar from anywhere
     */

    return ScaffoldMessenger.of(Navigation.key.currentContext!).showSnackBar(
      SnackBar(
        content: GlobalText(
          str: msg,
          fontWeight: FontWeight.w500,
          color: KColor.white.color,
        ),
        action: SnackBarAction(
          label: btnName ?? "",
          textColor: btnName == null ? Colors.transparent : KColor.white.color,
          onPressed: onPressed ?? () {},
        ),
      ),
    );
  }

  // this varialble is for internet connection check.
  static bool isPresentedDialog = false;
  static showInternetDialog({
    required VoidCallback onPressed,
  }) async {
    // flutter defined function.
    await showDialog(
      context: Navigation.key.currentContext!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog.
        return AlertDialog(
          title: const GlobalText(
            str: "Connection Error",
            fontWeight: FontWeight.w500,
          ),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const GlobalText(
                str: "Your internet connection appears to be offline",
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 25.h,
              ),
              GlobalButton(
                btnHeight: 25.h,
                onPressed: onPressed,
                buttonText: "Try Again",
                textFontSize: 12,
              )
            ],
          ),
        );
      },
    );
  }

// global alert dialog
  static Future showAlertDialog({
    Widget? title,
    required Widget content,
    List<Widget>? actions,
    Color? alertBackgroundColor,
    bool? barrierDismissible,
    BorderRadius? borderRadius,
    EdgeInsetsGeometry? contentPadding,
  }) async {
    // flutter defined function.
    await showDialog(
      context: Navigation.key.currentContext!,
      barrierDismissible: barrierDismissible ?? true,
      builder: (BuildContext context) {
        // return object of type Dialog.
        return AlertDialog(
          backgroundColor: alertBackgroundColor,
          contentPadding: contentPadding ??
              const EdgeInsets.fromLTRB(
                24.0,
                20.0,
                24.0,
                24.0,
              ),
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ??
                BorderRadius.all(
                  Radius.circular(8.w),
                ),
          ),
          title: title,
          content: content,
        );
      },
    );
  }

  static bottomSheet({
    required BuildContext context,
    bool? isDismissable,
    required Widget content,
    BoxConstraints? boxConstraints,
  }) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      constraints: boxConstraints,
      isScrollControlled: true,
      context: context,
      isDismissible: isDismissable ?? true,
      builder: (context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0x1a000000),
              offset: const Offset(0, 1),
              blurRadius: 3.r,
              spreadRadius: 0,
            )
          ],
          color: const Color(0xffffffff),
        ),
        child: content,
      ),
    );
  }
}
