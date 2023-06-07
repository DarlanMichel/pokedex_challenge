import 'dart:convert';

import 'package:challenge_pokedex/app/pokedex/data/datasources/get_pokemon_datasource.dart';
import 'package:challenge_pokedex/app/pokedex/data/adapters/pokemon_adapter.dart';
import 'package:challenge_pokedex/app/pokedex/domain/entities/pokemon_entity.dart';
import 'package:challenge_pokedex/core/shared/url_base.dart';
import 'package:http/http.dart' as http;

class GetPokemonDatasourceHttp implements IGetPokemonDatasource {
  @override
  Future<({Exception? failure, PokemonEntity? success})> call(
      {required String id}) async {
    PokemonEntity? success;
    Exception? failure;

    try {
      final response = await http.get(Uri.parse('$urlBase/$id'));
      final body = jsonDecode(response.body);

      success = PokemonAdapter.fromJson(body);
    } catch (e) {
      failure = Exception(e);
    }

    return (failure: failure, success: success);
  }
}
