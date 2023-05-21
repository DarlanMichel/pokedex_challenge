import 'dart:convert';

import 'package:challenge_pokedex/app/pokedex/data/datasources/get_all_datasource.dart';
import 'package:challenge_pokedex/app/pokedex/data/dtos/pokedex_list_dto.dart';
import 'package:challenge_pokedex/core/shared/url_base.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class IGetAllDatasource implements GetAllDatasource {
  @override
  Future<Either<Exception, List<PokedexListDto>>> call({int? offset}) async {
    try {
      final response =
          await http.get(Uri.parse('$urlBase?offset=${offset ?? 0}&limit=20'));
      final body = jsonDecode(response.body);

      return Right(
        (body['results'] as List)
            .map((e) => PokedexListDto.fromJson(e))
            .toList(),
      );
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
