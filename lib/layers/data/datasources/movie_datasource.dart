import 'package:movies/layers/domain/entities/genre_entity.dart';
import 'package:movies/layers/domain/entities/movie_entity.dart';

abstract class MovieDatasource {
  Future<List<MovieEntity>> getMovieList({required int? genreId});
  Future<List<GenreEntity>> getGenreList();
}
