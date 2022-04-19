import 'package:movies/layers/domain/entities/movie_entity.dart';

abstract class MovieDatasource {
  Future<List<MovieEntity>> getMovieList({required int page});
}