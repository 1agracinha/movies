import 'package:dartz/dartz.dart';
import 'package:movies/layers/data/datasources/movie_datasource.dart';
import 'package:movies/layers/domain/entities/movie_entity.dart';
import 'package:movies/layers/domain/repositories/movie_repository.dart';
import 'package:movies/layers/helpers/errors/domain_error.dart';

class MovieRepositoryImp implements MovieRepository {
  final MovieDatasource movieDatasource;
  MovieRepositoryImp(this.movieDatasource);

  @override
  Future<Either<DomainError, List<MovieEntity>>> getMovieList({
    int page = 0,
  }) async {
    try {
      final result = await movieDatasource.getMovieList(page: page);
      return Right(result);
    } on Exception catch (error) {
      return Left(convertToDomainError(error.toString()));
    }
  }
}
