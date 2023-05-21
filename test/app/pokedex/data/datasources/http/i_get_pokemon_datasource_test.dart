import 'package:challenge_pokedex/app/pokedex/data/datasources/get_pokemon_datasource.dart';
import 'package:challenge_pokedex/app/pokedex/data/datasources/http/i_get_pokemon_datasource.dart';
import 'package:challenge_pokedex/app/pokedex/domain/entities/pokemon_entity.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  GetPokemonDatasource getPokemonDatasource = IGetPokemonDatasource();

  test('Espero que retorne um pokemon', () async {
    var result = await getPokemonDatasource(id: '7');
    late PokemonEntity entity;
    result.fold((l) => null, (r) => entity = r);

    expect(entity, isNotNull);
  });

  test('Espero que retorne o pokemon squirtle', () async {
    var result = await getPokemonDatasource(id: '7');
    late PokemonEntity entity;
    result.fold((l) => null, (r) => entity = r);

    expect(entity.name, 'squirtle');
  });
}
