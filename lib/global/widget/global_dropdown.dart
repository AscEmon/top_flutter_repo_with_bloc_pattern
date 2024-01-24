import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'global_text.dart';
import '../../utils/styles/styles.dart';

class GlobalDropdown extends StatelessWidget {
  const GlobalDropdown({
    Key? key,
    required this.validator,
    required this.hintText,
    required this.onChanged,
    required this.items,
  }) : super(key: key);

  final String? Function(Object?)? validator;
  final String? hintText;
  final void Function(Object?)? onChanged;
  final List<DropdownMenuItem<Object>>? items;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      menuMaxHeight: 200,
      validator: validator,
      icon: const Icon(
        Icons.keyboard_arrow_down_rounded,
        color: Color(0xff9ea1a6),
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: KColor.fill.color,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: KColor.enableBorder.color, width: 1.w),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: KColor.red.color, width: 1.w),
          borderRadius: BorderRadius.circular(12.r),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: KColor.red.color, width: 1.w),
          borderRadius: BorderRadius.circular(12.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: KColor.divider.color, width: 1.w),
        ),
      ),
      isExpanded: true,
      hint: GlobalText(
       str: "$hintText",
       color: KColor.grey.color,
       fontSize: 18.sp,
       fontWeight: FontWeight.w400,
       fontStyle: FontStyle.normal,
      ),
      onChanged: onChanged,
      items: items,
    );
  }
}


 