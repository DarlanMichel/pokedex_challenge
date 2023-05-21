import 'package:challenge_pokedex/app/pokedex/domain/entities/pokemon_entity.dart';
import 'package:dartz/dartz.dart';

abstract class GetPokemonUsecase {
  Future<Either<Exception, PokemonEntity>> call({required String id});
}
