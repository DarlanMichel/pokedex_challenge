import 'package:challenge_pokedex/app/pokedex/data/datasources/http/get_pokemon_datasource_http.dart';
import 'package:challenge_pokedex/app/pokedex/data/repositories/get_pokemon_repository_imp.dart';
import 'package:challenge_pokedex/app/pokedex/domain/entities/pokemon_entity.dart';
import 'package:challenge_pokedex/app/pokedex/domain/usecases/get_pokemon_usecase.dart';
import 'package:challenge_pokedex/app/pokedex/domain/usecases/get_pokemon_usecase_imp.dart';
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

  IGetPokemonUsecase getPokemonUsecase = GetPokemonUsecase(
    GetPokemonRepository(
      GetPokemonDatasourceHttp(),
    ),
  );

  test('Espero que retorne um pokemon', () async {
    var result = await getPokemonUsecase(id: '7');
    expect(result.success, isNotNull);
  });

  test('Espero que retorne o pokemon especifico', () async {
    var result = await getPokemonUsecase(id: '7');
    expect(result.success?.name, pokemon.name);
  });
}
