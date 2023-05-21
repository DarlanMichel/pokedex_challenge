import 'package:challenge_pokedex/app/pokedex/data/dtos/pokemon_dto.dart';
import 'package:dartz/dartz.dart';

abstract class GetPokemonDatasource {
  Future<Either<Exception, PokemonDto>> call({required String id});
}
