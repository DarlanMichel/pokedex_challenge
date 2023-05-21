import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:challenge_pokedex/app/pokedex/domain/entities/pokedex_list_entity.dart';
import 'package:challenge_pokedex/app/pokedex/domain/usecases/get_all_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stream_transform/stream_transform.dart';

part 'pokedex_list_event.dart';
part 'pokedex_list_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class PokedexListBloc extends Bloc<PokedexListEvent, PokedexListState> {
  final GetAllUsecase getAllUsecase;

  PokedexListBloc({
    required this.getAllUsecase,
  }) : super(const PokedexListState()) {
    on<PokedexGetAll>(
      _onGetAll,
      transformer: throttleDroppable(throttleDuration),
    );
    on<PokedexSort>(
      _sortList,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  Future<void> _onGetAll(
    PokedexGetAll event,
    Emitter<PokedexListState> emit,
  ) async {
    if (state.hasReachedMax) return;

    try {
      if (state.status == PokedexListStatus.initial) {
        final result = await getAllUsecase();

        result.fold(
          (l) => emit(
            state.copyWith(status: PokedexListStatus.failure),
          ),
          (r) => emit(state.copyWith(
            status: PokedexListStatus.success,
            pokedexListEntity: r,
            hasReachedMax: false,
          )),
        );
      }
      final result =
          await getAllUsecase(offset: state.pokedexListEntity.length);
      result.fold(
        (l) => emit(
          state.copyWith(status: PokedexListStatus.failure),
        ),
        (r) => emit(r.isEmpty
            ? state.copyWith(hasReachedMax: true)
            : state.copyWith(
                status: PokedexListStatus.success,
                pokedexListEntity: List.of(state.pokedexListEntity)..addAll(r),
                hasReachedMax: false,
              )),
      );
    } catch (e) {
      emit(
        state.copyWith(status: PokedexListStatus.failure),
      );
    }
  }

  void _sortList(
    PokedexSort event,
    Emitter<PokedexListState> emit,
  ) {
    if (event.filter == 'name') {
      emit(
        state.copyWith(
          status: PokedexListStatus.success,
          pokedexListEntity: List.of(state.pokedexListEntity)
            ..sort((a, b) => (a.name ?? '').compareTo(b.name ?? '')),
        ),
      );
      
    } else {
      emit(
        state.copyWith(
          status: PokedexListStatus.success,
          pokedexListEntity: List.of(state.pokedexListEntity)
            ..sort((a, b) =>
                int.parse(a.url!.split('/')[a.url!.split('/').length - 2])
                    .compareTo(int.parse(
                        b.url!.split('/')[b.url!.split('/').length - 2]))),
        ),
      );
    }
  }
}
