import 'package:dartz/dartz.dart';
import 'package:movies/layers/domain/entities/movie_entity.dart';
import 'package:movies/layers/helpers/errors/domain_error.dart';

abstract class GetMovieListUsecase {
  Future<Either<DomainError, List<MovieEntity>>> call({
    int page,
  });
}
