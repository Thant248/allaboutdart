abstract class SearchState {}

class InitialState extends SearchState {}

class Loading extends SearchState {}

class LoadWords extends SearchState {
  final List<String> words;

  LoadWords(this.words);
}
