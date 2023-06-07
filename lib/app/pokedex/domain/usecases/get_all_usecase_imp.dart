import 'package:challenge_pokedex/app/pokedex/domain/entities/pokedex_list_entity.dart';
import 'package:challenge_pokedex/app/pokedex/domain/repositories/get_all_repository.dart';
import 'package:challenge_pokedex/app/pokedex/domain/usecases/get_all_usecase.dart';

class GetAllUsecase implements IGetAllUsecase {
  final IGetAllRepository _getAllRepository;
  GetAllUsecase(this._getAllRepository);

  @override
  Future<({Exception? failure, List<PokedexListEntity>? success})> call(
      {int? offset}) async {
    return await _getAllRepository(offset: offset);
  }
}
