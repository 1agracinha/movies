import 'package:movies/layers/domain/repositories/movie_repository.dart';
import 'package:movies/layers/domain/usecases/get_movies/get_movie_list_usecase.dart';
import 'package:movies/layers/domain/usecases/get_movies/get_movie_list_usecase_imp.dart';
import 'package:get_it/get_it.dart';

registerUsecasesDependencies(GetIt getIt) {
  getIt.registerFactory<GetMovieListUsecase>(
    () => GetMovieListUsecaseImp(GetIt.I.get<MovieRepository>()),
  );
}
