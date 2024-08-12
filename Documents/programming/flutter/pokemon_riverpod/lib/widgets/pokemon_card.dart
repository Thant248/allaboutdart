import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_riverpod/models/pokemon.dart';
import 'package:pokemon_riverpod/providers/pokemon_data_providers.dart';
import 'package:pokemon_riverpod/widgets/pokemon_stats.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PokemonCard extends ConsumerWidget {
  final String pokemonURL;
  const PokemonCard(this.pokemonURL, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemon = ref.watch(pokemonDataProvider(pokemonURL));
    return pokemon.when(data: (data) {
      return _card(context, false, pokemon.value);
    }, error: (error, StackTrace) {
      return Text('Error: $error');
    }, loading: () {
      return _card(context, true, null);
    });
  }

  Widget _card(BuildContext context, bool isLoading, Pokemon? pokemon) {
    return Skeletonizer(
        enabled: isLoading,
        ignoreContainers: true,
        child: GestureDetector(
          onTap: () {
            if (!isLoading) {
              showDialog(
                  context: context,
                  builder: (_) {
                    return PokemonStats(pokemonURL);
                  });
            }
          },
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.03,
              vertical: MediaQuery.sizeOf(context).height * 0.01,
            ),
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.03,
                vertical: MediaQuery.sizeOf(context).height * 0.01),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).primaryColor,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black, spreadRadius: 2, blurRadius: 10)
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      pokemon?.name?.toUpperCase() ?? 'Pokemon',
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '#${pokemon?.id?.toString()}',
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Expanded(
                    child: CircleAvatar(
                  backgroundImage: pokemon != null
                      ? NetworkImage(pokemon.sprites!.frontDefault!)
                      : null,
                  radius: MediaQuery.sizeOf(context).width * 0.05,
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${pokemon?.moves?.length} Moves",
                      style: const TextStyle(color: Colors.white),
                    ),
                    const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
