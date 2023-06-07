import 'package:cached_network_image/cached_network_image.dart';
import 'package:challenge_pokedex/app/pokedex/domain/entities/pokemon_entity.dart';
import 'package:challenge_pokedex/app/pokedex/presentation/bloc/pokemon_bloc.dart';
import 'package:challenge_pokedex/app/pokedex/presentation/widgets/pokemon_detail_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class PokemonPage extends StatefulWidget {
  final String pokemon;
  const PokemonPage({super.key, required this.pokemon});

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  Color typeColor(String typeName) {
    switch (typeName) {
      case 'bug':
        return const Color(0xffA7B723);
      case 'dark':
        return const Color(0xff75574C);
      case 'dragon':
        return const Color(0xff7037FF);
      case 'electric':
        return const Color(0xffF9CF30);
      case 'fairy':
        return const Color(0xffE69EAC);
      case 'fighting':
        return const Color(0xffC12239);
      case 'fire':
        return const Color(0xffF57D31);
      case 'flying':
        return const Color(0xffA891EC);
      case 'ghost':
        return const Color(0xff70559B);
      case 'normal':
        return const Color(0xffAAA67F);
      case 'grass':
        return const Color(0xff74CB48);
      case 'ground':
        return const Color(0xffDEC16B);
      case 'ice':
        return const Color(0xff9AD6DF);
      case 'poison':
        return const Color(0xffA43E9E);
      case 'psychic':
        return const Color(0xffFB5584);
      case 'rock':
        return const Color(0xffB69E31);
      case 'steel':
        return const Color(0xffB7B9D0);
      case 'water':
        return const Color(0xff6493EB);
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => GetIt.instance.get<PokemonBloc>()
            ..add(
              GetPokemon(id: widget.pokemon),
            ),
          child:
              BlocBuilder<PokemonBloc, PokemonState>(builder: (context, state) {
            switch (state.status) {
              case PokemonStatus.failure:
                return Container();
              case PokemonStatus.success:
                return Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: typeColor(
                          state.pokemonEntity?.types?.first.type?.name ?? ''),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/pokeball.png',
                          height: 208,
                          width: 208,
                          color: Colors.white.withOpacity(0.1),
                        ),
                      ),
                    ),
                    PokemonDetailCard(
                      pokemonEntity: state.pokemonEntity ?? PokemonEntity(),
                      colorType: typeColor,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(24),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () => Navigator.pop(context),
                                child: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 32,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  (state.pokemonEntity?.name ?? '')[0]
                                          .toUpperCase() +
                                      (state.pokemonEntity?.name ?? '')
                                          .substring(1),
                                  maxLines: 1,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge
                                      ?.copyWith(
                                          color: Colors.white,
                                          overflow: TextOverflow.ellipsis),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '#${(state.pokemonEntity?.number.toString() ?? '').padLeft(3, '0')}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      color: Colors.white,
                                    ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            state.pokemonEntity?.number == 1 ||
                                    state.pokemonEntity?.number == 10001
                                ? const SizedBox()
                                : Padding(
                                    padding: const EdgeInsets.only(left: 24),
                                    child: InkWell(
                                      onTap: () => Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (_, __, ___) =>
                                              PokemonPage(
                                                  pokemon: ((state.pokemonEntity
                                                                  ?.number ??
                                                              0) -
                                                          1)
                                                      .toString()),
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.arrow_back_ios_new_rounded,
                                        size: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                            CachedNetworkImage(
                              imageUrl: state.pokemonEntity?.image?.other
                                      ?.official?.front ??
                                  '',
                              height: 200,
                              width: 200,
                              errorWidget: (context, url, error) => const Icon(
                                Icons.image,
                                size: 80,
                                color: Colors.grey,
                              ),
                            ),
                            state.pokemonEntity?.number == 1010 ||
                                    state.pokemonEntity?.number == 10271
                                ? const SizedBox()
                                : Padding(
                                    padding: const EdgeInsets.only(right: 24),
                                    child: InkWell(
                                      onTap: () => Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (_, __, ___) =>
                                              PokemonPage(
                                                  pokemon: ((state.pokemonEntity
                                                                  ?.number ??
                                                              0) +
                                                          1)
                                                      .toString()),
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                          ],
                        )
                      ],
                    ),
                  ],
                );
              case PokemonStatus.initial:
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                );
            }
          }),
        ),
      ),
    );
  }
}
