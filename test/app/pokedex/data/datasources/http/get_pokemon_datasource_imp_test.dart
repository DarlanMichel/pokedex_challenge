import 'package:challenge_pokedex/app/pokedex/data/datasources/get_pokemon_datasource.dart';
import 'package:challenge_pokedex/app/pokedex/data/datasources/http/get_pokemon_datasource_http.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  IGetPokemonDatasource getPokemonDatasource = GetPokemonDatasourceHttp();

  test('Espero que retorne um pokemon', () async {
    var result = await getPokemonDatasource(id: '7');
    expect(result.success, isNotNull);
  });

  test('Espero que retorne o pokemon squirtle', () async {
    var result = await getPokemonDatasource(id: '7');
    expect(result.success?.name, 'squirtle');
  });
}
