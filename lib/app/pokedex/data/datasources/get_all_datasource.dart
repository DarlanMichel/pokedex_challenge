import 'package:challenge_pokedex/app/pokedex/data/dtos/pokedex_list_dto.dart';
import 'package:dartz/dartz.dart';

abstract class GetAllDatasource {
  Future<Either<Exception, List<PokedexListDto>>> call({int? offset});
}
