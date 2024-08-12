import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon_riverpod/models/pokemon.dart';
import 'package:pokemon_riverpod/services/database_servce.dart';
import 'package:pokemon_riverpod/services/http_service.dart';

final pokemonDataProvider = FutureProvider.family<Pokemon?, String>(
  (ref, url) async {
    HttpService _httpService = GetIt.instance.get<HttpService>();
    Response? res = await _httpService.getRequest(url);

    if (res != null && res.data != null) {
      return Pokemon.fromJson(res.data);
    }

    return null;
  },
);

final favoritePokemonsProvider =
    StateNotifierProvider<FavoritePokemon, List<String>>(
  (ref) {
    return FavoritePokemon([]);
  },
);

class FavoritePokemon extends StateNotifier<List<String>> {
  final DatabaseService _databaseService =
      GetIt.instance.get<DatabaseService>();

  String FAVORITE_POEMON_LIST_KEY = "FAVORITE_POEMON_LIST_KEY";
  FavoritePokemon(super.state) {
    _setup();
  }

  Future<void> _setup() async {
    List<String>? result =
        await _databaseService.getList(FAVORITE_POEMON_LIST_KEY);
    if (result != null) {
      state = result;
    }
  }

  void addFavoritePokemon(String url) {
    state = [...state, url];
    _databaseService.saveList(FAVORITE_POEMON_LIST_KEY, state);
  }

  void removeFavoritePokemon(String url) {
    state = state
        .where(
          (element) => element != url,
        )
        .toList();
    _databaseService.saveList(FAVORITE_POEMON_LIST_KEY, state);
  }
}
