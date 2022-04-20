import 'package:movies/layers/domain/entities/genre_entity.dart';
import 'package:movies/layers/domain/entities/movie_entity.dart';
import 'package:movies/layers/domain/usecases/get_genres/get_genre_list_usecase.dart';

abstract class MovieDatasource {
  Future<List<MovieEntity>> getMovieList({required int page});
  Future<List<GenreEntity>> getGenreList();
}