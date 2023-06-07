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