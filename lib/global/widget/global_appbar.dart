  import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/styles/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'global_text.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor = KColor.secondary.color;
  final String title;
  final bool? centerTitle;
  final List<Widget>? actions;

  GlobalAppBar({
    Key? key,
    required this.title,
    this.centerTitle,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      title: GlobalText(
        str: title,
        style: GoogleFonts.poppins(
          color: KColor.white.color,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}


 