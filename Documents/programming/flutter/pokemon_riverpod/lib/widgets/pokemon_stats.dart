import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_riverpod/providers/pokemon_data_providers.dart';

class PokemonStats extends ConsumerWidget {
  final String pokemonURL;
  const PokemonStats(this.pokemonURL, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemon  = ref.watch(pokemonDataProvider(pokemonURL));
    return AlertDialog(
       title: const Text("Statistics"),
       content: pokemon.when(data: (data) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: data?.stats?.map((e){
            return Text("${e.stat?.name?.toUpperCase()} : ${e.baseStat}",
            );
          },).toList() ?? [],
        );
       }, error: (e, stackTrace) {
        return const Text("Error:");
       }, loading: (){
        return const CircularProgressIndicator(color: Colors.white,);
       }),
    );
  }
}