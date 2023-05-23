import 'package:challenge_pokedex/app/pokedex/domain/entities/pokemon_entity.dart';
import 'package:flutter/material.dart';

class AboutPokemon extends StatelessWidget {
  final PokemonEntity pokemonEntity;
  const AboutPokemon({super.key, required this.pokemonEntity});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/weight.png',
                  height: 16,
                  width: 16,
                  color: const Color(0xff1D1D1D),
                ),
                const SizedBox(width: 8),
                Text(
                    '${((pokemonEntity.weight ?? 0) * 0.1).toStringAsFixed(1).replaceAll('.', ',')} kg')
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'Weight',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: const Color(0xff666666), fontSize: 8),
            )
          ],
        ),
        Container(
          height: 48,
          width: 1,
          color: const Color(0xffE0E0E0),
        ),
        Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/straighten.png',
                  height: 16,
                  width: 16,
                  color: const Color(0xff1D1D1D),
                ),
                const SizedBox(width: 8),
                Text(
                    '${((pokemonEntity.height ?? 0) * 0.1).toStringAsFixed(1).replaceAll('.', ',')} m')
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'Height',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: const Color(0xff666666), fontSize: 8),
            )
          ],
        ),
        Container(
          height: 48,
          width: 1,
          color: const Color(0xffE0E0E0),
        ),
        Column(
          children: [
            (pokemonEntity.moves?.length ?? 0) == 0
                ? const SizedBox()
                : Text(
                    (pokemonEntity.moves?[0].ability?.name ?? '')
                        .split('-')
                        .map((element) {
                      return element[0].toUpperCase() + element.substring(1);
                    }).join('-'),
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: const Color(0xff1D1D1D)),
                  ),
            (pokemonEntity.moves?.length ?? 0) <= 1
                ? const SizedBox()
                : Text(
                    (pokemonEntity.moves?[1].ability?.name ?? '')
                        .split('-')
                        .map((element) {
                      return element[0].toUpperCase() + element.substring(1);
                    }).join('-'),
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: const Color(0xff1D1D1D)),
                  ),
            SizedBox(height: (pokemonEntity.moves?.length ?? 0) > 1 ? 4 : 12),
            Text(
              'Moves',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: const Color(0xff666666), fontSize: 8),
            )
          ],
        ),
      ],
    );
  }
}
