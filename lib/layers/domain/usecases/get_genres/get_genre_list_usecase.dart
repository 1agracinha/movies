import 'package:dartz/dartz.dart';
import 'package:movies/layers/domain/entities/genre_entity.dart';
import 'package:movies/layers/helpers/errors/domain_error.dart';

abstract class GetGenreListUsecase {
  Future<Either<DomainError, List<GenreEntity>>> call();
}
