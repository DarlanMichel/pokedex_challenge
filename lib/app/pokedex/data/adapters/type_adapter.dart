import 'package:challenge_pokedex/app/pokedex/domain/entities/type_entity.dart';

class TypesAdapter {
  static TypesEntity fromJson(Map<String, dynamic> json) => TypesEntity(
        slot: json["slot"],
        type: json["type"] == null ? null : TypeAdapter.fromJson(json["type"]),
      );

  static List<TypesEntity> fromList(List list) {
    return list.map((e) => fromJson(e)).toList();
  }
}

class TypeAdapter {
  static TypeEntity fromJson(Map<String, dynamic> json) => TypeEntity(
        name: json["name"],
        url: json["url"],
      );
}
