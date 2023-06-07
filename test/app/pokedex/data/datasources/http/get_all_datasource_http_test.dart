import 'package:challenge_pokedex/app/pokedex/data/datasources/get_all_datasource.dart';
import 'package:challenge_pokedex/app/pokedex/data/datasources/http/get_all_datasource_http.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  IGetAllDatasource getAllDatasource = GetAllDatasourceHttp();

  test('Espero que retorne uma lista de pokedexListEntity', () async {
    var result = await getAllDatasource();
    expect(result.success, isNotEmpty);
  });

  test('Espero que retorne uma lista com 20 pokemons', () async {
    var result = await getAllDatasource();
    expect((result.success ?? []).length, 20);
  });
}
