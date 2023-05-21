import 'package:challenge_pokedex/app/pokedex/domain/entities/pokedex_list_entity.dart';
import 'package:dartz/dartz.dart';

abstract class GetAllUsecase {
  Future<Either<Exception, List<PokedexListEntity>>> call({int? offset});
}
