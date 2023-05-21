import 'package:challenge_pokedex/app/pokedex/domain/entities/pokemon_entity.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  PokemonEntity pokemonEntity = PokemonEntity(
    name: 'squirtle',
    number: 7,
    height: 5,
    weight: 90,
    image: SpriteEntity(
      other: OtherEntity(
        official: OfficialEntity(
          front:
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/7.png',
          shiny:
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/7.png',
        ),
      ),
    ),
    moves: [
      AbilitiesEntity(
        ability: AbilityEntity(name: 'torrent'),
      ),
      AbilitiesEntity(
        ability: AbilityEntity(name: 'rain-dish'),
      ),
    ],
    stats: [
      StatsEntity(
        base: 44,
        stat: StatEntity(name: 'hp'),
      ),
      StatsEntity(
        base: 48,
        stat: StatEntity(name: 'attack'),
      ),
      StatsEntity(
        base: 65,
        stat: StatEntity(name: 'defense'),
      ),
      StatsEntity(
        base: 50,
        stat: StatEntity(name: 'special-attack'),
      ),
      StatsEntity(
        base: 64,
        stat: StatEntity(name: 'special-defense'),
      ),
      StatsEntity(
        base: 43,
        stat: StatEntity(name: 'speed'),
      ),
    ],
    types: [
      TypesEntity(
        slot: 1,
        type: TypeEntity(
          name: 'water',
          url: 'https://pokeapi.co/api/v2/type/11/',
        ),
      )
    ],
  );

  test('Espero que a entidade não seja nula ', () {
    expect(pokemonEntity, isNotNull);
  });
}
