import 'package:challenge_pokedex/app/pokedex/data/datasources/get_all_datasource.dart';
import 'package:challenge_pokedex/app/pokedex/domain/entities/pokedex_list_entity.dart';
import 'package:challenge_pokedex/app/pokedex/domain/repositories/get_all_repository.dart';
import 'package:dartz/dartz.dart';

class IGetAllRepository implements GetAllRepository {
  final GetAllDatasource _getAllDatasource;

  IGetAllRepository(this._getAllDatasource);

  @override
  Future<Either<Exception, List<PokedexListEntity>>> call({int? offset}) async {
    return await _getAllDatasource(offset: offset);
  }
}
