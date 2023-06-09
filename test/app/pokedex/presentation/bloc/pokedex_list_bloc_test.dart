import 'package:challenge_pokedex/app/pokedex/data/datasources/http/get_all_datasource_http.dart';
import 'package:challenge_pokedex/app/pokedex/data/repositories/get_all_repository_imp.dart';
import 'package:challenge_pokedex/app/pokedex/domain/usecases/get_all_usecase.dart';
import 'package:challenge_pokedex/app/pokedex/domain/usecases/get_all_usecase_imp.dart';
import 'package:challenge_pokedex/app/pokedex/presentation/bloc/pokedex_list_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  IGetAllUsecase getAllUsecase = GetAllUsecase(
    GetAllRepository(
      GetAllDatasourceHttp(),
    ),
  );

  late PokedexListBloc bloc;

  setUp(() => bloc = PokedexListBloc(getAllUsecase: getAllUsecase)
    ..add(PokedexGetAll()));

  test('Espero status de success', () {
    expect(bloc.state.status, PokedexListStatus.initial);
  });
}
