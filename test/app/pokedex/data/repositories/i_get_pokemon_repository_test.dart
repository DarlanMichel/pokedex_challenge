import 'package:challenge_pokedex/app/pokedex/data/datasources/http/i_get_pokemon_datasource.dart';
import 'package:challenge_pokedex/app/pokedex/data/repositories/i_get_pokemon_repository.dart';
import 'package:challenge_pokedex/app/pokedex/domain/entities/pokemon_entity.dart';
import 'package:challenge_pokedex/app/pokedex/domain/repositories/get_pokemon_repository.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  GetPokemonRepository getPokemonRepository = IGetPokemonRepository(
    IGetPokemonDatasource(),
  );

  test('Espero que retorne um pokemon', () async {
    var result = await getPokemonRepository(id: '7');
    late PokemonEntity entity;
    result.fold((l) => null, (r) => entity = r);

    expect(entity, isNotNull);
  });

  test('Espero que retorne o pokemon squirtle', () async {
    var result = await getPokemonRepository(id: '7');
    late PokemonEntity entity;
    result.fold((l) => null, (r) => entity = r);

    expect(entity.name, 'squirtle');
  });
}
