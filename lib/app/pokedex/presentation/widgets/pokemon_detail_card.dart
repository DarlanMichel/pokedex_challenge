import 'package:challenge_pokedex/app/pokedex/domain/entities/pokemon_entity.dart';
import 'package:challenge_pokedex/app/pokedex/presentation/widgets/about_pokemon.dart';
import 'package:challenge_pokedex/app/pokedex/presentation/widgets/stats_bar.dart';
import 'package:challenge_pokedex/app/pokedex/presentation/widgets/stats_label.dart';
import 'package:flutter/material.dart';

class PokemonDetailCard extends StatelessWidget {
  final PokemonEntity pokemonEntity;
  final Function(String) colorType;
  const PokemonDetailCard(
      {super.key, required this.pokemonEntity, required this.colorType});

  @override
  Widget build(BuildContext context) {
    Color principalColor =
        colorType(pokemonEntity.types?.first.type?.name ?? '');

    return Container(
      height: double.infinity,
      width: double.infinity,
      margin: const EdgeInsets.only(
        top: 224,
        right: 4,
        left: 4,
        bottom: 4,
      ),
      padding: const EdgeInsets.only(
        top: 56,
        right: 20,
        left: 20,
        bottom: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurStyle: BlurStyle.inner,
          ),
          const BoxShadow(
              color: Colors.white,
              blurStyle: BlurStyle.inner,
              spreadRadius: 1.0,
              blurRadius: 3.0,
              offset: Offset(0, 1)),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 20,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: pokemonEntity.types?.length,
              itemBuilder: (context, i) {
                return Container(
                  height: 20,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: colorType(pokemonEntity.types?[i].type?.name ?? ''),
                  ),
                  child: Center(
                    child: Text(
                      (pokemonEntity.types?[i].type?.name ?? '')[0]
                              .toUpperCase() +
                          (pokemonEntity.types?[i].type?.name ?? '')
                              .substring(1),
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'About',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: principalColor,
                ),
          ),
          const SizedBox(height: 16),
          AboutPokemon(pokemonEntity: pokemonEntity),
          const SizedBox(height: 16),
          Text(
            'Base Stats',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: principalColor),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  StatsLabel(principalColor: principalColor, label: 'HP'),
                  StatsLabel(principalColor: principalColor, label: 'ATK'),
                  StatsLabel(principalColor: principalColor, label: 'DEF'),
                  StatsLabel(principalColor: principalColor, label: 'SATK'),
                  StatsLabel(principalColor: principalColor, label: 'SDEF'),
                  StatsLabel(principalColor: principalColor, label: 'SPD'),
                ],
              ),
              const SizedBox(width: 12),
              Container(
                width: 1,
                height: 96,
                color: const Color(0xffE0E0E0),
              ),
              const SizedBox(width: 12),
              Column(
                children: [
                  StatsBar(
                    valueBase: pokemonEntity
                            .stats?[(pokemonEntity.stats ?? []).indexWhere(
                                (element) => element.stat?.name == 'hp')]
                            .base ??
                        0,
                    principalColor: principalColor,
                  ),
                  StatsBar(
                    valueBase: pokemonEntity
                            .stats?[(pokemonEntity.stats ?? []).indexWhere(
                                (element) => element.stat?.name == 'attack')]
                            .base ??
                        0,
                    principalColor: principalColor,
                  ),
                  StatsBar(
                    valueBase: pokemonEntity
                            .stats?[(pokemonEntity.stats ?? []).indexWhere(
                                (element) => element.stat?.name == 'defense')]
                            .base ??
                        0,
                    principalColor: principalColor,
                  ),
                  StatsBar(
                    valueBase: pokemonEntity
                            .stats?[(pokemonEntity.stats ?? []).indexWhere(
                                (element) =>
                                    element.stat?.name == 'special-attack')]
                            .base ??
                        0,
                    principalColor: principalColor,
                  ),
                  StatsBar(
                    valueBase: pokemonEntity
                            .stats?[(pokemonEntity.stats ?? []).indexWhere(
                                (element) =>
                                    element.stat?.name == 'special-defense')]
                            .base ??
                        0,
                    principalColor: principalColor,
                  ),
                  StatsBar(
                    valueBase: pokemonEntity
                            .stats?[(pokemonEntity.stats ?? []).indexWhere(
                                (element) => element.stat?.name == 'speed')]
                            .base ??
                        0,
                    principalColor: principalColor,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
