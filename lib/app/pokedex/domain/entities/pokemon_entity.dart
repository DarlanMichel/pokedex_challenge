import 'package:challenge_pokedex/app/pokedex/domain/entities/ability_entity.dart';
import 'package:challenge_pokedex/app/pokedex/domain/entities/sprite_entity.dart';
import 'package:challenge_pokedex/app/pokedex/domain/entities/stats_entity.dart';
import 'package:challenge_pokedex/app/pokedex/domain/entities/type_entity.dart';

class PokemonEntity {
  int? number;
  String? name;
  List<TypesEntity>? types;
  int? weight;
  int? height;
  List<AbilitiesEntity>? moves;
  SpriteEntity? image;
  List<StatsEntity>? stats;

  PokemonEntity({
    this.number,
    this.name,
    this.types,
    this.weight,
    this.height,
    this.moves,
    this.image,
    this.stats,
  });
}
