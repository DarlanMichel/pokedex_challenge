import 'dart:convert';

import 'package:challenge_pokedex/app/pokedex/data/datasources/get_pokemon_datasource.dart';
import 'package:challenge_pokedex/app/pokedex/data/dtos/pokemon_dto.dart';
import 'package:challenge_pokedex/core/shared/url_base.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class IGetPokemonDatasource implements GetPokemonDatasource {
  @override
  Future<Either<Exception, PokemonDto>> call({required String id}) async {
    try {
      final response = await http.get(Uri.parse('$urlBase/$id'));
      final body = jsonDecode(response.body);

      return Right(
        PokemonDto.fromJson(body),
      );
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
