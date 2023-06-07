import 'package:challenge_pokedex/app/pokedex/data/datasources/get_pokemon_datasource.dart';
import 'package:challenge_pokedex/app/pokedex/domain/entities/pokemon_entity.dart';
import 'package:challenge_pokedex/app/pokedex/domain/repositories/get_pokemon_repository.dart';

class GetPokemonRepository implements IGetPokemonRepository {
  final IGetPokemonDatasource _getPokemonDatasource;

  GetPokemonRepository(this._getPokemonDatasource);

  @override
  Future<({Exception? failure, PokemonEntity? success})> call(
      {required String id}) async {
    return await _getPokemonDatasource(id: id);
  }
}
