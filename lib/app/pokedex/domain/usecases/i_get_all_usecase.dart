import 'package:challenge_pokedex/app/pokedex/domain/entities/pokedex_list_entity.dart';
import 'package:challenge_pokedex/app/pokedex/domain/repositories/get_all_repository.dart';
import 'package:challenge_pokedex/app/pokedex/domain/usecases/get_all_usecase.dart';
import 'package:dartz/dartz.dart';

class IGetAllUsecase implements GetAllUsecase {
  final GetAllRepository _getAllRepository;
  IGetAllUsecase(this._getAllRepository);

  @override
  Future<Either<Exception, List<PokedexListEntity>>> call({int? offset}) async {
    return await _getAllRepository(offset: offset);
  }
}
