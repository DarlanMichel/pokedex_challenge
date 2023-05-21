import 'package:challenge_pokedex/app/pokedex/data/datasources/get_all_datasource.dart';
import 'package:challenge_pokedex/app/pokedex/data/datasources/get_pokemon_datasource.dart';
import 'package:challenge_pokedex/app/pokedex/data/datasources/http/i_get_all_datasource.dart';
import 'package:challenge_pokedex/app/pokedex/data/datasources/http/i_get_pokemon_datasource.dart';
import 'package:challenge_pokedex/app/pokedex/data/repositories/i_get_all_repository.dart';
import 'package:challenge_pokedex/app/pokedex/data/repositories/i_get_pokemon_repository.dart';
import 'package:challenge_pokedex/app/pokedex/domain/repositories/get_all_repository.dart';
import 'package:challenge_pokedex/app/pokedex/domain/repositories/get_pokemon_repository.dart';
import 'package:challenge_pokedex/app/pokedex/domain/usecases/get_all_usecase.dart';
import 'package:challenge_pokedex/app/pokedex/domain/usecases/get_pokemon_usecase.dart';
import 'package:challenge_pokedex/app/pokedex/domain/usecases/i_get_all_usecase.dart';
import 'package:challenge_pokedex/app/pokedex/domain/usecases/i_get_pokemon_usecase.dart';
import 'package:challenge_pokedex/app/pokedex/presentation/bloc/pokedex_list_bloc.dart';
import 'package:challenge_pokedex/app/pokedex/presentation/bloc/pokemon_bloc.dart';
import 'package:get_it/get_it.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;

    getIt.registerLazySingleton<GetAllDatasource>(
      () => IGetAllDatasource(),
    );
    getIt.registerLazySingleton<GetPokemonDatasource>(
      () => IGetPokemonDatasource(),
    );

    getIt.registerLazySingleton<GetAllRepository>(
      () => IGetAllRepository(getIt()),
    );
    getIt.registerLazySingleton<GetPokemonRepository>(
      () => IGetPokemonRepository(getIt()),
    );

    getIt.registerLazySingleton<GetAllUsecase>(
      () => IGetAllUsecase(getIt()),
    );
    getIt.registerLazySingleton<GetPokemonUsecase>(
      () => IGetPokemonUsecase(getIt()),
    );

    getIt.registerFactory<PokedexListBloc>(
      () => PokedexListBloc(getAllUsecase: getIt()),
    );
    getIt.registerFactory<PokemonBloc>(
      () => PokemonBloc(getPokemonUsecase: getIt()),
    );
  }
}
