import 'package:dartz/dartz.dart';
import 'package:movies/core/network/network_info.dart';
import 'package:movies/layers/data/datasources/movie_datasource.dart';
import 'package:movies/layers/domain/entities/genre_entity.dart';
import 'package:movies/layers/domain/entities/movie_entity.dart';
import 'package:movies/layers/domain/repositories/movie_repository.dart';
import 'package:movies/layers/helpers/errors/domain_error.dart';

class MovieRepositoryImp implements MovieRepository {
  final NetWorkInfo netWorkInfo;
  final MovieDatasource movieDatasource;
  MovieRepositoryImp(
      {required this.movieDatasource, required this.netWorkInfo});

  @override
  Future<Either<DomainError, List<MovieEntity>>> getMovieList({
    int? genreId,
    int? releaseYear
  }) async {
    try {
      if (await netWorkInfo.isConnected) {
        final result = await movieDatasource.getMovieList(genreId: genreId, releaseYear: releaseYear);
        return Right(result);
      } else {
        return const Left(DomainError.noInternet);
      }
    } on Exception catch (error) {
      return Left(convertToDomainError(error.toString()));
    }
  }

  @override
  Future<Either<DomainError, List<GenreEntity>>> getGenreList() async {
    try {
      if (await netWorkInfo.isConnected) {
        final result = await movieDatasource.getGenreList();
        return Right(result);
      } else {
        return const Left(DomainError.noInternet);
      }
    } on Exception catch (error) {
      return Left(convertToDomainError(error.toString()));
    }
  }
}
