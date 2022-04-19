import 'package:get_it/get_it.dart';
import 'package:movies/layers/data/datasources/movie_datasource.dart';
import 'package:movies/layers/data/repositories/movie_repository_imp.dart';
import 'package:movies/layers/domain/repositories/movie_repository.dart';

registerRepositoriesDependencies(GetIt getIt) {
  getIt.registerFactory<MovieRepository>(
    () => MovieRepositoryImp(getIt.get<MovieDatasource>()),
  );
}
