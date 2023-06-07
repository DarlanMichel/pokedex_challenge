import 'package:challenge_pokedex/app/pokedex/data/datasources/get_all_datasource.dart';
import 'package:challenge_pokedex/app/pokedex/data/datasources/get_pokemon_datasource.dart';
import 'package:challenge_pokedex/app/pokedex/data/datasources/http/get_all_datasource_http.dart';
import 'package:challenge_pokedex/app/pokedex/data/datasources/http/get_pokemon_datasource_http.dart';
import 'package:challenge_pokedex/app/pokedex/data/repositories/get_all_repository_imp.dart';
import 'package:challenge_pokedex/app/pokedex/data/repositories/get_pokemon_repository_imp.dart';
import 'package:challenge_pokedex/app/pokedex/domain/repositories/get_all_repository.dart';
import 'package:challenge_pokedex/app/pokedex/domain/repositories/get_pokemon_repository.dart';
import 'package:challenge_pokedex/app/pokedex/domain/usecases/get_all_usecase.dart';
import 'package:challenge_pokedex/app/pokedex/domain/usecases/get_pokemon_usecase.dart';
import 'package:challenge_pokedex/app/pokedex/domain/usecases/get_all_usecase_imp.dart';
import 'package:challenge_pokedex/app/pokedex/domain/usecases/get_pokemon_usecase_imp.dart';
import 'package:challenge_pokedex/app/pokedex/presentation/bloc/pokedex_list_bloc.dart';
import 'package:challenge_pokedex/app/pokedex/presentation/bloc/pokemon_bloc.dart';
import 'package:get_it/get_it.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;

    getIt.registerLazySingleton<IGetAllDatasource>(
      () => GetAllDatasourceHttp(),
    );
    getIt.registerLazySingleton<IGetPokemonDatasource>(
      () => GetPokemonDatasourceHttp(),
    );

    getIt.registerLazySingleton<IGetAllRepository>(
      () => GetAllRepository(getIt()),
    );
    getIt.registerLazySingleton<IGetPokemonRepository>(
      () => GetPokemonRepository(getIt()),
    );

    getIt.registerLazySingleton<IGetAllUsecase>(
      () => GetAllUsecase(getIt()),
    );
    getIt.registerLazySingleton<IGetPokemonUsecase>(
      () => GetPokemonUsecase(getIt()),
    );

    getIt.registerFactory<PokedexListBloc>(
      () => PokedexListBloc(getAllUsecase: getIt()),
    );
    getIt.registerFactory<PokemonBloc>(
      () => PokemonBloc(getPokemonUsecase: getIt()),
    );
  }
}
