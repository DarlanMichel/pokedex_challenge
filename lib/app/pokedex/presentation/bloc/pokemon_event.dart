part of 'pokemon_bloc.dart';

sealed class PokemonEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class GetPokemon extends PokemonEvent {
  final String id;
  GetPokemon({required this.id});
}
