import 'package:challenge_pokedex/app/pokedex/data/datasources/http/i_get_pokemon_datasource.dart';
import 'package:challenge_pokedex/app/pokedex/data/repositories/i_get_pokemon_repository.dart';
import 'package:challenge_pokedex/app/pokedex/domain/entities/pokemon_entity.dart';
import 'package:challenge_pokedex/app/pokedex/domain/usecases/get_pokemon_usecase.dart';
import 'package:challenge_pokedex/app/pokedex/domain/usecases/i_get_pokemon_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  PokemonEntity pokemon = PokemonEntity(
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

  GetPokemonUsecase getPokemonUsecase = IGetPokemonUsecase(
    IGetPokemonRepository(
      IGetPokemonDatasource(),
    ),
  );

  test('Espero que retorne um pokemon', () async {
    var result = await getPokemonUsecase(id: '7');
    late PokemonEntity entity;
    result.fold((l) => null, (r) => entity = r);

    expect(entity, isNotNull);
  });

  test('Espero que retorne o pokemon especifico', () async {
    var result = await getPokemonUsecase(id: '7');
    late PokemonEntity entity;
    result.fold((l) => null, (r) => entity = r);

    expect(entity.name, pokemon.name);
  });
}
