import 'package:challenge_pokedex/app/pokedex/data/datasources/get_all_datasource.dart';
import 'package:challenge_pokedex/app/pokedex/domain/entities/pokedex_list_entity.dart';
import 'package:challenge_pokedex/app/pokedex/domain/repositories/get_all_repository.dart';

class GetAllRepository implements IGetAllRepository {
  final IGetAllDatasource _getAllDatasource;

  GetAllRepository(this._getAllDatasource);

  @override
  Future<({Exception? failure, List<PokedexListEntity>? success})> call(
      {int? offset}) async {
    return await _getAllDatasource(offset: offset);
  }
}
