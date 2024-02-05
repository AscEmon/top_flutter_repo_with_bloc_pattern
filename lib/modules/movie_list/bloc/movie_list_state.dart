import 'package:flutter/material.dart';

@immutable
class MovieListState {
  final int index;
  const MovieListState({this.index = 0});

  MovieListState copyWith({int? index}) {
    return MovieListState(
      index: index ?? this.index,
    );
  }
}
