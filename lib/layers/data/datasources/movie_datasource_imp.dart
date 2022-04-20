import 'package:dio/dio.dart';
import 'package:movies/infra/http/http_client.dart';
import 'package:movies/layers/data/datasources/movie_datasource.dart';
import 'package:movies/layers/data/dtos/genrer_dto.dart';
import 'package:movies/layers/data/dtos/movie_dto.dart';
import 'package:movies/layers/domain/entities/genre_entity.dart';
import 'package:movies/layers/domain/entities/movie_entity.dart';

class MovieDatasourceImp implements MovieDatasource {
  final HttpClient client;

  MovieDatasourceImp(this.client);

  @override
  Future<List<MovieEntity>> getMovieList({required int? genreId}) async {
    try {
      const url = '/discover/movie';
      final response = await client
          .get(url, query: {'with_genres': genreId, 'language': 'pt-BR'});
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

  @override
  Future<List<GenreEntity>> getGenreList() async {
    try {
      const url = '/genre/movie/list';
      final response = await client.get(url, query: {'language': 'pt-BR'});
      final genres = response.data['genres'];

      return GenrerDto.fromJsonList(genres);
    } catch (error) {
      if (error is DioError) {
        throw Exception(error);
      } else {
        throw Exception(error.toString());
      }
    }
  }
}
