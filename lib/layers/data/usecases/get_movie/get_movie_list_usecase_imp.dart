import 'package:dartz/dartz.dart';
import 'package:movies/layers/domain/entities/movie_entity.dart';
import 'package:movies/layers/domain/repositories/movie_repository.dart';
import 'package:movies/layers/domain/usecases/get_movies/get_movie_list_usecase.dart';
import 'package:movies/layers/helpers/errors/domain_error.dart';

class GetMovieListUsecaseImp implements GetMovieListUsecase {
  final MovieRepository repository;
  GetMovieListUsecaseImp(this.repository);
  @override
  Future<Either<DomainError, List<MovieEntity>>> call({
    int? genreId,
  }) async {
    return await repository.getMovieList(genreId: genreId);
  }
}
