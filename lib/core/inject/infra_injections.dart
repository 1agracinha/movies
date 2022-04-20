import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/core/network/network_info.dart';
import 'package:movies/infra/http/dio_instance.dart';
import 'package:movies/infra/http/dio_http_client_imp.dart';
import 'package:movies/infra/http/http_client.dart';

registerInfraDependencies(GetIt getIt) {
  getIt.registerFactory<HttpClient>(() => DioHttpClientImp(DioInstance.api()));

  getIt.registerLazySingleton<DataConnectionChecker>(
      () => DataConnectionChecker());

  getIt.registerLazySingleton<NetWorkInfo>(() => NetworkInfoImp(getIt()));
}
