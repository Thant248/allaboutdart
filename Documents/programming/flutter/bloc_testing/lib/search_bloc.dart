import 'package:bloc_testing/search_event.dart';
import 'package:bloc_testing/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(InitialState()) {
    on<SearchWord>((event, emit) {
      List<String> searchTitles = [];

      for (var i in searchTitles) {
        if (i.contains(event.word)) {
          searchTitles.add(i);
        }
      }
      emit(LoadWords(
         searchTitles
      ));
    });
  }

  List<String> word = [
    "Flutter",
    "Google",
    "Flutter Guys",
    "Tutorial",
    "Bloc Course",
    "State management",
    "Project"
  ];
}
