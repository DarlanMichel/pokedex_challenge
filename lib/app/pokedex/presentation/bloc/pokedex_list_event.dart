part of 'pokedex_list_bloc.dart';

sealed class PokedexListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class PokedexGetAll extends PokedexListEvent {}

final class PokedexSort extends PokedexListEvent {
  final String filter;
  PokedexSort({required this.filter});
}
