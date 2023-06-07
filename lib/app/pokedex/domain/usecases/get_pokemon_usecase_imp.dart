import 'package:challenge_pokedex/app/pokedex/domain/entities/pokemon_entity.dart';
import 'package:challenge_pokedex/app/pokedex/domain/repositories/get_pokemon_repository.dart';
import 'package:challenge_pokedex/app/pokedex/domain/usecases/get_pokemon_usecase.dart';

class GetPokemonUsecase implements IGetPokemonUsecase {
  final IGetPokemonRepository _getPokemonRepository;
  GetPokemonUsecase(this._getPokemonRepository);

  @override
  Future<({Exception? failure, PokemonEntity? success})> call(
      {required String id}) async {
    return await _getPokemonRepository(id: id);
  }
}
