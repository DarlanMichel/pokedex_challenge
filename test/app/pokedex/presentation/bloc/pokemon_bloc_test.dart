import 'package:bloc_test/bloc_test.dart';
import 'package:challenge_pokedex/app/pokedex/data/datasources/http/get_pokemon_datasource_http.dart';
import 'package:challenge_pokedex/app/pokedex/data/repositories/get_pokemon_repository_imp.dart';
import 'package:challenge_pokedex/app/pokedex/domain/usecases/get_pokemon_usecase.dart';
import 'package:challenge_pokedex/app/pokedex/domain/usecases/get_pokemon_usecase_imp.dart';
import 'package:challenge_pokedex/app/pokedex/presentation/bloc/pokemon_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  IGetPokemonUsecase getPokemonUsecase = GetPokemonUsecase(
    GetPokemonRepository(
      GetPokemonDatasourceHttp(),
    ),
  );

  blocTest('Espero status de success',
      build: () => PokemonBloc(getPokemonUsecase: getPokemonUsecase),
      act: (bloc) => bloc.add(GetPokemon(id: '7')),
      wait: const Duration(milliseconds: 300),
      expect: () => [isA<PokemonState>()]);
}
