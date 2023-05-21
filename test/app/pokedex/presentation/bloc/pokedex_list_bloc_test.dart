import 'package:challenge_pokedex/app/pokedex/data/datasources/http/i_get_all_datasource.dart';
import 'package:challenge_pokedex/app/pokedex/data/repositories/i_get_all_repository.dart';
import 'package:challenge_pokedex/app/pokedex/domain/usecases/get_all_usecase.dart';
import 'package:challenge_pokedex/app/pokedex/domain/usecases/i_get_all_usecase.dart';
import 'package:challenge_pokedex/app/pokedex/presentation/bloc/pokedex_list_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  GetAllUsecase getAllUsecase = IGetAllUsecase(
    IGetAllRepository(
      IGetAllDatasource(),
    ),
  );

  late PokedexListBloc bloc;

  setUp(() => bloc = PokedexListBloc(getAllUsecase: getAllUsecase)
    ..add(PokedexGetAll()));
    

  test('Espero status de success', () {
    expect(bloc.state.status, PokedexListStatus.initial);
  });
}
