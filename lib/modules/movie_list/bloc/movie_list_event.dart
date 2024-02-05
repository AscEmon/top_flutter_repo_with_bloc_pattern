sealed class MovieListEvent {}

class BackgroundChanged implements MovieListEvent {
  int index;
  BackgroundChanged({required this.index});
}
