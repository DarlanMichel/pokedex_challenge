import 'package:challenge_pokedex/app/pokedex/domain/entities/ability_entity.dart';

class AbilitiesAdapter {
  static AbilitiesEntity fromJson(Map<String, dynamic> json) => AbilitiesEntity(
        ability: json["ability"] == null
            ? null
            : AbilityAdapter.fromJson(json["ability"]),
      );

  static List<AbilitiesEntity> fromList(List list) {
    return list.map((e) => fromJson(e)).toList();
  }
}

class AbilityAdapter {
  static AbilityEntity fromJson(Map<String, dynamic> json) => AbilityEntity(
        name: json["name"],
      );
}
