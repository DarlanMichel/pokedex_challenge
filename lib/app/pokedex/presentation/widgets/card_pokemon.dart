import 'package:cached_network_image/cached_network_image.dart';
import 'package:challenge_pokedex/app/pokedex/domain/entities/pokedex_list_entity.dart';
import 'package:challenge_pokedex/app/pokedex/presentation/bloc/pokemon_bloc.dart';
import 'package:challenge_pokedex/app/pokedex/presentation/pages/pokemon_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardPokemon extends StatefulWidget {
  final PokedexListEntity pokedexEntity;
  const CardPokemon({super.key, required this.pokedexEntity});

  @override
  State<CardPokemon> createState() => _CardPokemonState();
}

class _CardPokemonState extends State<CardPokemon> {
  String getNumber(String url) {
    List<String> split = url.split('/');
    return split[split.length - 2];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonBloc, PokemonState>(builder: (context, state) {
      switch (state.status) {
        case PokemonStatus.failure:
          return Container();
        case PokemonStatus.success:
          if ((state.pokemonEntity?.name ?? '').isEmpty) {
            return Container();
          }
          return InkWell(
            onTap: () => Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => PokemonPage(
                  pokemon: state.pokemonEntity?.name ?? '1',
                ),
              ),
            ),
            child: Card(
              color: Colors.white,
              surfaceTintColor: Colors.white,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: const Color(0xffEFEFEF),
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 8,
                            top: 4,
                          ),
                          child: Text(
                            '#${getNumber(widget.pokedexEntity.url ?? '').padLeft(3, '0')}',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    color: const Color(0xff666666),
                                    fontSize: 8),
                          ),
                        ),
                      ),
                      CachedNetworkImage(
                        imageUrl: state
                                .pokemonEntity?.image?.other?.official?.front ??
                            '',
                        height: 63,
                        width: 63,
                        errorWidget: (context, url, error) => const Icon(
                          Icons.image,
                          size: 20,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          (widget.pokedexEntity.name ?? '')[0].toUpperCase() +
                              (widget.pokedexEntity.name ?? '').substring(1),
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: const Color(0xff1D1D1D),
                                  overflow: TextOverflow.ellipsis),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        case PokemonStatus.initial:
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
      }
    });
  }
}
