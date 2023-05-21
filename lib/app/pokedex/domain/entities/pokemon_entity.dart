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

class TypesEntity {
  int? slot;
  TypeEntity? type;

  TypesEntity({this.slot, this.type});
}

class TypeEntity {
  String? name;
  String? url;
  TypeEntity({this.name, this.url});
}

class AbilitiesEntity {
  AbilityEntity? ability;
  AbilitiesEntity({this.ability});
}

class AbilityEntity {
  String? name;
  AbilityEntity({this.name});
}

class SpriteEntity {
  OtherEntity? other;
  SpriteEntity({this.other});
}

class OtherEntity {
  OfficialEntity? official;
  OtherEntity({this.official});
}

class OfficialEntity {
  String? front;
  String? shiny;

  OfficialEntity({this.front, this.shiny});
}

class StatsEntity {
  int? base;
  StatEntity? stat;

  StatsEntity({this.base, this.stat});
}

class StatEntity {
  String? name;

  StatEntity({this.name});
}
