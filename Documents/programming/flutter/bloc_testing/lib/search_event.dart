abstract class SearchEvent {}

class SearchWord extends SearchEvent {
  final String word;

  SearchWord({required this.word});
  
}
