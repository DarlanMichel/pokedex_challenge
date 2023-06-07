import 'package:challenge_pokedex/app/pokedex/data/datasources/http/get_all_datasource_http.dart';
import 'package:challenge_pokedex/app/pokedex/data/repositories/get_all_repository_imp.dart';
import 'package:challenge_pokedex/app/pokedex/domain/usecases/get_all_usecase.dart';
import 'package:challenge_pokedex/app/pokedex/domain/usecases/get_all_usecase_imp.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  IGetAllUsecase getAllUsecase = GetAllUsecase(
    GetAllRepository(
      GetAllDatasourceHttp(),
    ),
  );

  test('Espero que retorne uma lista de pokedexListEntity', () async {
    var result = await getAllUsecase();
    expect(result.success, isNotEmpty);
  });

  test('Espero que retorne uma lista com 20 pokemons', () async {
    var result = await getAllUsecase();
    expect((result.success ?? []).length, 20);
  });
}
