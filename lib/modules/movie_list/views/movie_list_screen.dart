import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_flutter_repo/global/widget/global_appbar.dart';
import 'package:top_flutter_repo/modules/movie_list/bloc/movie_list_bloc.dart';
import 'package:top_flutter_repo/modules/movie_list/bloc/movie_list_event.dart';
import 'package:top_flutter_repo/modules/movie_list/bloc/movie_list_state.dart';
import 'package:top_flutter_repo/modules/movie_list/views/components/movie_card.dart';
import 'package:top_flutter_repo/utils/styles/k_colors.dart';

import '../../../utils/mixin/movie_image_mixin.dart';

class MovieListScreen extends StatelessWidget with MovieImage {
  const MovieListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MovieListBloc>();
    return Scaffold(
      backgroundColor: KColor.black.color,
      appBar: GlobalAppBar(title: "Movies"),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: BlocBuilder<MovieListBloc, MovieListState>(
              builder: (context, state) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage(getImage(state.index)),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      decoration:
                          BoxDecoration(color: Colors.white.withOpacity(0.0)),
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: 400.h,
                child: RotatedBox(
                  quarterTurns: 3,
                  child: ListWheelScrollView(
                    offAxisFraction: 0.2,
                    itemExtent: 240.w,
                    physics: const FixedExtentScrollPhysics(),
                    scrollBehavior: const CupertinoScrollBehavior(),
                    onSelectedItemChanged: (value) {
                      bloc.add(BackgroundChanged(index: value));
                    },
                    children: List.generate(
                      5,
                      (index) => MovieCard(index: index),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
