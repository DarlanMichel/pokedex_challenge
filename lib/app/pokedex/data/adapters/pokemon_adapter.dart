import 'package:challenge_pokedex/app/pokedex/data/adapters/ability_adapter.dart';
import 'package:challenge_pokedex/app/pokedex/data/adapters/sprites_adapter.dart';
import 'package:challenge_pokedex/app/pokedex/data/adapters/stats_adapter.dart';
import 'package:challenge_pokedex/app/pokedex/data/adapters/type_adapter.dart';
import 'package:challenge_pokedex/app/pokedex/domain/entities/pokemon_entity.dart';

class PokemonAdapter {
  static PokemonEntity fromJson(Map<String, dynamic> json) => PokemonEntity(
        number: json["id"],
        name: json["name"],
        types:
            json["types"] == null ? [] : TypesAdapter.fromList(json["types"]),
        weight: json["weight"],
        height: json["height"],
        moves: json["abilities"] == null
            ? []
            : AbilitiesAdapter.fromList(json["abilities"]),
        image: json["sprites"] == null
            ? null
            : SpritesAdaper.fromJson(json["sprites"]),
        stats:
            json["stats"] == null ? [] : StatsAdapter.fromList(json["stats"]),
      );
}
