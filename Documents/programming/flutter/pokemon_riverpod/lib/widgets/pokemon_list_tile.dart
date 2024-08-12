import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_riverpod/models/pokemon.dart';
import 'package:pokemon_riverpod/providers/pokemon_data_providers.dart';
import 'package:pokemon_riverpod/widgets/pokemon_stats.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PokemonListTile extends ConsumerWidget {
  final String pokemonURL;

  late FavoritePokemon _favoritePokemonsProvider;
  late List<String> _favoritePokemons;

  PokemonListTile({required this.pokemonURL});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemon = ref.watch(pokemonDataProvider(pokemonURL));
    _favoritePokemonsProvider = ref.watch(favoritePokemonsProvider.notifier);
    _favoritePokemons = ref.watch(favoritePokemonsProvider);
    return pokemon.when(data: (data) {
      return _tile(context, false, pokemon.value);
    }, error: (e, stackTrace) {
      return Text('Error: $e');
    }, loading: () {
      return _tile(context, true, null);
    });
  }

  Widget _tile(BuildContext context, bool isLoading, Pokemon? pokemon) {
    return Skeletonizer(
      enabled: isLoading,
      child: ListTile(
        onTap: () {
          if (!isLoading) {
            showDialog(
                context: context,
                builder: (_) {
                  return PokemonStats(pokemonURL);
                });
          }
        },
        leading: pokemon != null
            ? CircleAvatar(
                backgroundImage: NetworkImage(pokemon.sprites!.frontDefault!))
            : const CircleAvatar(),
        title: Text(pokemon != null
            ? pokemon.name!.toUpperCase()
            : "Currently loading name for Pokemon."),
        subtitle: Text("Has ${pokemon?.moves?.length.toString() ?? 0} moves"),
        trailing: IconButton(
          onPressed: () {
            if (_favoritePokemons.contains(pokemonURL)) {
              _favoritePokemonsProvider.removeFavoritePokemon(pokemonURL);
            } else {
              _favoritePokemonsProvider.addFavoritePokemon(pokemonURL);
            }
          },
          icon: Icon(_favoritePokemons.contains(pokemonURL)
              ? Icons.favorite
              : Icons.favorite_border),
          color: Colors.red,
        ),
      ),
    );
  }
}
