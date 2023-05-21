import 'package:bloc_test/bloc_test.dart';
import 'package:challenge_pokedex/app/pokedex/data/datasources/http/i_get_pokemon_datasource.dart';
import 'package:challenge_pokedex/app/pokedex/data/repositories/i_get_pokemon_repository.dart';
import 'package:challenge_pokedex/app/pokedex/domain/usecases/get_pokemon_usecase.dart';
import 'package:challenge_pokedex/app/pokedex/domain/usecases/i_get_pokemon_usecase.dart';
import 'package:challenge_pokedex/app/pokedex/presentation/bloc/pokemon_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  GetPokemonUsecase getPokemonUsecase = IGetPokemonUsecase(
    IGetPokemonRepository(
      IGetPokemonDatasource(),
    ),
  );

  blocTest('Espero status de success',
      build: () => PokemonBloc(getPokemonUsecase: getPokemonUsecase),
      act: (bloc) => bloc.add(GetPokemon(id: '7')),
      wait: const Duration(milliseconds: 300),
      expect: () => [isA<PokemonState>()]);
}
