import 'package:challenge_pokedex/app/pokedex/domain/entities/stats_entity.dart';

class StatsAdapter {
  static StatsEntity fromJson(Map<String, dynamic> json) => StatsEntity(
        base: json["base_stat"],
        stat: json["stat"] == null ? null : StatAdapter.fromJson(json["stat"]),
      );

  static List<StatsEntity> fromList(List list) {
    return list.map((e) => fromJson(e)).toList();
  }
}

class StatAdapter {
  static StatEntity fromJson(Map<String, dynamic> json) => StatEntity(
        name: json["name"],
      );
}
