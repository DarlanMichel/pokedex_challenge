import 'package:challenge_pokedex/app/pokedex/data/datasources/http/i_get_all_datasource.dart';
import 'package:challenge_pokedex/app/pokedex/data/repositories/i_get_all_repository.dart';
import 'package:challenge_pokedex/app/pokedex/domain/entities/pokedex_list_entity.dart';
import 'package:challenge_pokedex/app/pokedex/domain/repositories/get_all_repository.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  GetAllRepository getAllRepository = IGetAllRepository(
    IGetAllDatasource(),
  );

  test('Espero que retorne uma lista de pokedexListEntity', () async {
    var result = await getAllRepository();
    late List<PokedexListEntity> entity;
    result.fold((l) => null, (r) => entity = r);

    expect(entity, isNotEmpty);
  });

  test('Espero que retorne uma lista com 20 pokemons', () async {
    var result = await getAllRepository();
    late List<PokedexListEntity> entity;
    result.fold((l) => null, (r) => entity = r);

    expect(entity.length, 20);
  });
}
