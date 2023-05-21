import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:challenge_pokedex/app/pokedex/domain/entities/pokemon_entity.dart';
import 'package:challenge_pokedex/app/pokedex/domain/usecases/get_pokemon_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final GetPokemonUsecase getPokemonUsecase;

  PokemonBloc({
    required this.getPokemonUsecase,
  }) : super(const PokemonState()) {
    on<GetPokemon>(
      _onGetPokemon,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  Future<void> _onGetPokemon(
      GetPokemon event, Emitter<PokemonState> emit) async {
    try {
      final result = await getPokemonUsecase(id: event.id);
      result.fold(
        (l) => emit(
          state.copyWith(status: PokemonStatus.failure),
        ),
        (r) => emit(
          state.copyWith(
            status: PokemonStatus.success,
            pokemonEntity: r,
          ),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: PokemonStatus.failure),
      );
    }
  }
}
