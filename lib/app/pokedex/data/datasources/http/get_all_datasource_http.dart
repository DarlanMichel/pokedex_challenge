import 'dart:convert';

import 'package:challenge_pokedex/app/pokedex/data/datasources/get_all_datasource.dart';
import 'package:challenge_pokedex/app/pokedex/data/adapters/pokedex_list_adapter.dart';
import 'package:challenge_pokedex/app/pokedex/domain/entities/pokedex_list_entity.dart';
import 'package:challenge_pokedex/core/shared/url_base.dart';
import 'package:http/http.dart' as http;

class GetAllDatasourceHttp implements IGetAllDatasource {
  @override
  Future<({Exception? failure, List<PokedexListEntity>? success})> call(
      {int? offset}) async {
    List<PokedexListEntity>? success;
    Exception? failure;
    try {
      final response =
          await http.get(Uri.parse('$urlBase?offset=${offset ?? 0}&limit=20'));
      final body = jsonDecode(response.body);

      success = PokedexListAdapter.fromList(body['results'] as List);
    } catch (e) {
      failure = Exception(e);
    }

    return (failure: failure, success: success);
  }
}
