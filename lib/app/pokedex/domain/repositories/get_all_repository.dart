import 'package:challenge_pokedex/app/pokedex/domain/entities/pokedex_list_entity.dart';

abstract class IGetAllRepository {
  Future<({Exception? failure, List<PokedexListEntity>? success})> call(
      {int? offset});
}
