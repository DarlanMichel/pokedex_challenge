import 'package:challenge_pokedex/app/pokedex/domain/entities/pokedex_list_entity.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  PokedexListEntity pokedexListEntity = PokedexListEntity(
      name: 'bulbasaur',
      url: 'https://pokeapi.co/api/v2/pokemon/1/'
  );

  test('Espero que a entidade não seja nula ', () {
    expect(pokedexListEntity, isNotNull);
  });
}