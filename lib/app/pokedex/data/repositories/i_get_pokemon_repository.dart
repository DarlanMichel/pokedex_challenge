import 'package:challenge_pokedex/app/pokedex/data/datasources/get_pokemon_datasource.dart';
import 'package:challenge_pokedex/app/pokedex/domain/entities/pokemon_entity.dart';
import 'package:challenge_pokedex/app/pokedex/domain/repositories/get_pokemon_repository.dart';
import 'package:dartz/dartz.dart';

class IGetPokemonRepository implements GetPokemonRepository {
  final GetPokemonDatasource _getPokemonDatasource;

  IGetPokemonRepository(this._getPokemonDatasource);

  @override
  Future<Either<Exception, PokemonEntity>> call({required String id}) async {
    return await _getPokemonDatasource(id: id);
  }
}
