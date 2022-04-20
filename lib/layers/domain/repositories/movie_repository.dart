import 'package:dartz/dartz.dart';
import 'package:movies/layers/domain/entities/genre_entity.dart';
import 'package:movies/layers/domain/entities/movie_entity.dart';
import 'package:movies/layers/helpers/errors/domain_error.dart';

abstract class MovieRepository {
  Future<Either<DomainError, List<MovieEntity>>> getMovieList({
    int? genreId,
  });
  Future<Either<DomainError, List<GenreEntity>>> getGenreList();
}
