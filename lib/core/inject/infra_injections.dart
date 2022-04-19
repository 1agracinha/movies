import 'package:get_it/get_it.dart';
import 'package:movies/infra/http/dio_instance.dart';
import 'package:movies/infra/http/dio_http_client_imp.dart';
import 'package:movies/infra/http/http_client.dart';

registerInfraDependencies(GetIt getIt) {
  getIt.registerFactory<HttpClient>(() => DioHttpClientImp(DioInstance.api()));
}