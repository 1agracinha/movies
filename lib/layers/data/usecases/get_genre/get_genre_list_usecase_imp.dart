import 'package:dartz/dartz.dart';
import 'package:movies/layers/domain/entities/genre_entity.dart';
import 'package:movies/layers/domain/repositories/movie_repository.dart';
import 'package:movies/layers/domain/usecases/get_genres/get_genre_list_usecase.dart';
import 'package:movies/layers/helpers/errors/domain_error.dart';

class GetGenreListUsecaseImp implements GetGenreListUsecase {
  final MovieRepository repository;
  GetGenreListUsecaseImp(this.repository);
  @override
  Future<Either<DomainError, List<GenreEntity>>> call() async {
    return await repository.getGenreList();
  }
}


