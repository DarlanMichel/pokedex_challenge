part of 'pokedex_list_bloc.dart';

enum PokedexListStatus { initial, success, failure }

final class PokedexListState extends Equatable {
  const PokedexListState({
    this.status = PokedexListStatus.initial,
    this.pokedexListEntity = const <PokedexListEntity>[],
    this.hasReachedMax = false,
  });

  final PokedexListStatus status;
  final List<PokedexListEntity> pokedexListEntity;
  final bool hasReachedMax;

  PokedexListState copyWith({
    PokedexListStatus? status,
   List<PokedexListEntity>? pokedexListEntity,
  bool? hasReachedMax,
  }){
    return PokedexListState(
      status: status ?? this.status,
      pokedexListEntity: pokedexListEntity ?? this.pokedexListEntity,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''PokedexListState { status: $status, hasReachedMax: $hasReachedMax, pokedexListEntity: ${pokedexListEntity.length} }''';
  }

  @override
  List<Object?> get props => [status, pokedexListEntity, hasReachedMax];
}
