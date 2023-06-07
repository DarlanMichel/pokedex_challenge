import 'package:challenge_pokedex/app/pokedex/domain/entities/sprite_entity.dart';

class SpritesAdaper {
  static SpriteEntity fromJson(Map<String, dynamic> json) => SpriteEntity(
        other:
            json["other"] == null ? null : OtherAdapter.fromJson(json["other"]),
      );
}

class OtherAdapter {
  static OtherEntity fromJson(Map<String, dynamic> json) => OtherEntity(
        official: json["official-artwork"] == null
            ? null
            : OfficialArtworkAdapter.fromJson(json["official-artwork"]),
      );
}

class OfficialArtworkAdapter {
  static OfficialEntity fromJson(Map<String, dynamic> json) => OfficialEntity(
        front: json["front_default"],
        shiny: json["front_shiny"],
      );
}
