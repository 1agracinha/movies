import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movies/infra/http/http_client.dart';
import 'package:movies/layers/data/datasources/movie_datasource.dart';
import 'package:movies/layers/data/dtos/movie_dto.dart';
import 'package:movies/layers/domain/entities/movie_entity.dart';

class MovieDatasourceImp implements MovieDatasource {
  final HttpClient client;

  MovieDatasourceImp(this.client);

  @override
  Future<List<MovieEntity>> getMovieList({required int page}) async {
    List<MovieEntity> entities = [];
    try {
      final url = '/discover/movie?page=$page';
      final response = await client.get(url);
      final movies = response.data['results'];

      return MovieDto.fromJsonList(movies);
    } catch (error) {
      if (error is DioError) {
        throw Exception(error);
      } else {
        throw Exception(error.toString());
      }
    }
  }
}
