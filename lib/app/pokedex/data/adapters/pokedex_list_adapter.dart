import 'package:challenge_pokedex/app/pokedex/domain/entities/pokedex_list_entity.dart';

class PokedexListAdapter {
  static PokedexListEntity fromJson(Map<String, dynamic> json) =>
      PokedexListEntity(
        name: json["name"],
        url: json["url"],
      );

  static List<PokedexListEntity> fromList(List list) {
    return list.map((e) => fromJson(e)).toList();
  }
}
