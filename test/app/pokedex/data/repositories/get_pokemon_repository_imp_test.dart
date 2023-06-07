import 'package:challenge_pokedex/app/pokedex/data/datasources/http/get_pokemon_datasource_http.dart';
import 'package:challenge_pokedex/app/pokedex/data/repositories/get_pokemon_repository_imp.dart';
import 'package:challenge_pokedex/app/pokedex/domain/repositories/get_pokemon_repository.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  IGetPokemonRepository getPokemonRepository = GetPokemonRepository(
    GetPokemonDatasourceHttp(),
  );

  test('Espero que retorne um pokemon', () async {
    var result = await getPokemonRepository(id: '7');
    expect(result.success, isNotNull);
  });

  test('Espero que retorne o pokemon squirtle', () async {
    var result = await getPokemonRepository(id: '7');
    expect(result.success?.name, 'squirtle');
  });
}
