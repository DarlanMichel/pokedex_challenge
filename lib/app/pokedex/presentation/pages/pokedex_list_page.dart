import 'package:challenge_pokedex/app/pokedex/presentation/bloc/pokedex_list_bloc.dart';
import 'package:challenge_pokedex/app/pokedex/presentation/bloc/pokemon_bloc.dart';
import 'package:challenge_pokedex/app/pokedex/presentation/widgets/bottom_loader.dart';
import 'package:challenge_pokedex/app/pokedex/presentation/widgets/card_pokemon.dart';
import 'package:challenge_pokedex/app/pokedex/presentation/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class PokedexListPage extends StatefulWidget {
  const PokedexListPage({super.key});

  @override
  State<PokedexListPage> createState() => _PokedexListPageState();
}

class _PokedexListPageState extends State<PokedexListPage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<PokedexListBloc>().add(PokedexGetAll());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderPokedex(),
      body: Container(
        height: MediaQuery.of(context).size.height - 108,
        width: MediaQuery.of(context).size.width,
        color: const Color(0xffDC0A2D),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          margin: const EdgeInsets.all(4),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: BlocBuilder<PokedexListBloc, PokedexListState>(
              builder: (context, state) {
            switch (state.status) {
              case PokedexListStatus.failure:
                return Container();
              case PokedexListStatus.success:
                if (state.pokedexListEntity.isEmpty) {
                  return Container();
                }
                return GridView.builder(
                    controller: _scrollController,
                    itemCount: state.hasReachedMax
                        ? state.pokedexListEntity.length
                        : state.pokedexListEntity.length + 1,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (context, i) {
                      return i >= state.pokedexListEntity.length
                          ? const BottomLoader()
                          : BlocProvider(
                              create: (context) =>
                                  GetIt.instance.get<PokemonBloc>()
                                    ..add(
                                      GetPokemon(
                                          id: state.pokedexListEntity[i].name ??
                                              ''),
                                    ),
                              child: CardPokemon(
                                  pokedexEntity: state.pokedexListEntity[i]),
                            );
                    });
              case PokedexListStatus.initial:
                return const Center(
                  child: CircularProgressIndicator(),
                );
            }
          }),
        ),
      ),
    );
  }
}
