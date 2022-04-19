import 'package:get_it/get_it.dart';
import 'package:movies/infra/http/http_client.dart';
import 'package:movies/layers/data/datasources/movie_datasource.dart';
import 'package:movies/layers/data/datasources/movie_datasource_imp.dart';

registerDatasourcesDependencies(GetIt getIt) {
  getIt.registerFactory<MovieDatasource>(
    () => MovieDatasourceImp(getIt.get<HttpClient>()),
  );
}
