part of 'pokemon_bloc.dart';

enum PokemonStatus { initial, success, failure }

final class PokemonState extends Equatable {
  const PokemonState({
    this.status = PokemonStatus.initial,
    this.pokemonEntity,
  });

  final PokemonStatus status;
  final PokemonEntity? pokemonEntity;

  PokemonState copyWith({
    PokemonStatus? status,
    PokemonEntity? pokemonEntity,
  }) {
    return PokemonState(
      status: status ?? this.status,
      pokemonEntity: pokemonEntity ?? this.pokemonEntity,
    );
  }

  @override
  String toString() {
    return '''PokemonState { status: $status, pokemonEntity: $pokemonEntity }''';
  }

  @override
  List<Object?> get props => [status, pokemonEntity];
}
