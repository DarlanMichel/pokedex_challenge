import 'package:challenge_pokedex/app/pokedex/domain/entities/pokedex_list_entity.dart';

class PokedexListDto extends PokedexListEntity {
  String? pokemonName;
  String? link;

  PokedexListDto({
    this.pokemonName,
    this.link,
  }) : super(
          name: pokemonName,
          url: link,
        );

  factory PokedexListDto.fromJson(Map<String, dynamic> json) => PokedexListDto(
        pokemonName: json["name"],
        link: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": pokemonName,
        "url": link,
      };
}
