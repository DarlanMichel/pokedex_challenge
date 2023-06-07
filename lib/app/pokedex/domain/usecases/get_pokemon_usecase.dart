import 'package:challenge_pokedex/app/pokedex/domain/entities/pokemon_entity.dart';

abstract class IGetPokemonUsecase {
  Future<({Exception? failure, PokemonEntity? success})> call(
      {required String id});
}
