import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_flutter_repo/modules/movie_list/bloc/movie_list_event.dart';
import 'package:top_flutter_repo/modules/movie_list/bloc/movie_list_state.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  MovieListBloc() : super(const MovieListState()) {
    on<BackgroundChanged>(_backgroundChanedBasedonIndex);
  }

  void _backgroundChanedBasedonIndex(
      BackgroundChanged event, Emitter<MovieListState> emit) {
    emit(state.copyWith(index: event.index));
  }
}
