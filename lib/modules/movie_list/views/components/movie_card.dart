import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../global/widget/global_image_loader.dart';
import '../../../../utils/mixin/movie_image_mixin.dart';

class MovieCard extends StatelessWidget with MovieImage {
  const MovieCard({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RotatedBox(
          quarterTurns: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: GlobalImageLoader(
              imagePath: getImage(index),
              fit: BoxFit.fill,
              height: 380.h,
              width: 300.w,
            ),
          ),
        ),
        Positioned.fill(
          child: RotatedBox(
            quarterTurns: 1,
            child: Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.play_circle_outline,
                size: 40.w,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
