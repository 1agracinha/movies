import 'package:get_it/get_it.dart';
import 'package:movies/core/inject/datasources_injections.dart';
import 'package:movies/core/inject/infra_injections.dart';
import 'package:movies/core/inject/repositories_injections.dart';
import 'package:movies/core/inject/usecase_injections.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;

    registerUsecasesDependencies(getIt);
    registerDatasourcesDependencies(getIt);
    registerRepositoriesDependencies(getIt);
    registerInfraDependencies(getIt);
  }
}
