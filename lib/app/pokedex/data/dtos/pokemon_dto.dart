import 'package:challenge_pokedex/app/pokedex/domain/entities/pokemon_entity.dart';

class PokemonDto extends PokemonEntity {
  int? id;
  String? pokemonName;
  List<TypesDto>? pokemonTypes;
  int? pokemonWeight;
  int? pokemonHeight;
  List<AbilitiesDto>? abilities;
  SpritesDto? sprites;
  List<StatsDto>? pokemonStats;

  PokemonDto({
    this.id,
    this.pokemonName,
    this.pokemonTypes,
    this.pokemonWeight,
    this.pokemonHeight,
    this.abilities,
    this.sprites,
    this.pokemonStats,
  }) : super(
          number: id,
          name: pokemonName,
          types: pokemonTypes,
          weight: pokemonWeight,
          height: pokemonHeight,
          moves: abilities,
          image: sprites,
          stats: pokemonStats,
        );

  factory PokemonDto.fromJson(Map<String, dynamic> json) => PokemonDto(
        id: json["id"],
        pokemonName: json["name"],
        pokemonTypes: json["types"] == null
            ? []
            : List<TypesDto>.from(
                json["types"]!.map((x) => TypesDto.fromJson(x))),
        pokemonWeight: json["weight"],
        pokemonHeight: json["height"],
        abilities: json["abilities"] == null
            ? []
            : List<AbilitiesDto>.from(
                json["abilities"]!.map((x) => AbilitiesDto.fromJson(x))),
        sprites: json["sprites"] == null
            ? null
            : SpritesDto.fromJson(json["sprites"]),
        pokemonStats: json["stats"] == null
            ? []
            : List<StatsDto>.from(
                json["stats"]!.map((x) => StatsDto.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": pokemonName,
        "types": pokemonTypes == null
            ? []
            : List<dynamic>.from(pokemonTypes!.map((x) => x.toJson())),
        "weight": pokemonWeight,
        "height": pokemonHeight,
        "abilities": abilities == null
            ? []
            : List<dynamic>.from(abilities!.map((x) => x.toJson())),
        "sprites": sprites?.toJson(),
        "stats": pokemonStats == null
            ? []
            : List<dynamic>.from(pokemonStats!.map((x) => x.toJson())),
      };
}

class TypesDto extends TypesEntity {
  int? typesSlot;
  TypeDto? typesType;

  TypesDto({
    this.typesSlot,
    this.typesType,
  }) : super(slot: typesSlot, type: typesType);

  factory TypesDto.fromJson(Map<String, dynamic> json) => TypesDto(
        typesSlot: json["slot"],
        typesType: json["type"] == null ? null : TypeDto.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "slot": typesSlot,
        "type": typesType?.toJson(),
      };
}

class TypeDto extends TypeEntity {
  String? typeName;
  String? typeUrl;

  TypeDto({
    this.typeName,
    this.typeUrl,
  }) : super(name: typeName, url: typeUrl);

  factory TypeDto.fromJson(Map<String, dynamic> json) => TypeDto(
        typeName: json["name"],
        typeUrl: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": typeName,
        "url": typeUrl,
      };
}

class AbilitiesDto extends AbilitiesEntity {
  AbilityDto? pokemonAbility;

  AbilitiesDto({
    this.pokemonAbility,
  }) : super(ability: pokemonAbility);

  factory AbilitiesDto.fromJson(Map<String, dynamic> json) => AbilitiesDto(
        pokemonAbility: json["ability"] == null
            ? null
            : AbilityDto.fromJson(json["ability"]),
      );

  Map<String, dynamic> toJson() => {
        "ability": pokemonAbility?.toJson(),
      };
}

class AbilityDto extends AbilityEntity {
  String? abilityName;

  AbilityDto({this.abilityName}) : super(name: abilityName);

  factory AbilityDto.fromJson(Map<String, dynamic> json) => AbilityDto(
        abilityName: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": abilityName,
      };
}

class SpritesDto extends SpriteEntity {
  OtherDto? otherDto;

  SpritesDto({
    this.otherDto,
  }) : super(other: otherDto);

  factory SpritesDto.fromJson(Map<String, dynamic> json) => SpritesDto(
        otherDto:
            json["other"] == null ? null : OtherDto.fromJson(json["other"]),
      );

  Map<String, dynamic> toJson() => {
        "other": otherDto?.toJson(),
      };
}

class OtherDto extends OtherEntity {
  OfficialArtworkDto? officialArtwork;

  OtherDto({
    this.officialArtwork,
  }) : super(official: officialArtwork);

  factory OtherDto.fromJson(Map<String, dynamic> json) => OtherDto(
        officialArtwork: json["official-artwork"] == null
            ? null
            : OfficialArtworkDto.fromJson(json["official-artwork"]),
      );

  Map<String, dynamic> toJson() => {
        "official-artwork": officialArtwork?.toJson(),
      };
}

class OfficialArtworkDto extends OfficialEntity {
  String? frontDefault;
  String? frontShiny;

  OfficialArtworkDto({
    this.frontDefault,
    this.frontShiny,
  }) : super(front: frontDefault, shiny: frontShiny);

  factory OfficialArtworkDto.fromJson(Map<String, dynamic> json) =>
      OfficialArtworkDto(
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_shiny": frontShiny,
      };
}

class StatsDto extends StatsEntity {
  int? baseStat;
  StatDto? statDto;

  StatsDto({
    this.baseStat,
    this.statDto,
  }) : super(base: baseStat, stat: statDto);

  factory StatsDto.fromJson(Map<String, dynamic> json) => StatsDto(
        baseStat: json["base_stat"],
        statDto: json["stat"] == null ? null : StatDto.fromJson(json["stat"]),
      );

  Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "stat": statDto?.toJson(),
      };
}

class StatDto extends StatEntity {
  String? statName;

  StatDto({
    this.statName,
  }) : super(name: statName);

  factory StatDto.fromJson(Map<String, dynamic> json) => StatDto(
        statName: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": statName,
      };
}
