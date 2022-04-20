import 'package:get_it/get_it.dart';
import 'package:movies/layers/presentation/home/controller/home_controller.dart';

registerControllerDependencies(GetIt getIt) {
  getIt.registerLazySingleton<HomeController>(
    () => HomeController(),
  );
}
