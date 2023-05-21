import 'package:challenge_pokedex/app/pokedex/domain/entities/pokemon_entity.dart';
import 'package:challenge_pokedex/app/pokedex/domain/repositories/get_pokemon_repository.dart';
import 'package:challenge_pokedex/app/pokedex/domain/usecases/get_pokemon_usecase.dart';
import 'package:dartz/dartz.dart';

class IGetPokemonUsecase implements GetPokemonUsecase {
  final GetPokemonRepository _getPokemonRepository;
  IGetPokemonUsecase(this._getPokemonRepository);

  @override
  Future<Either<Exception, PokemonEntity>> call({required String id}) async {
    return await _getPokemonRepository(id: id);
  }
}
