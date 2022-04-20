import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:movies/layers/domain/entities/movie_entity.dart';
import 'package:movies/layers/domain/usecases/get_movies/get_movie_list_usecase.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

enum ViewState { start, loading, done, error }

abstract class HomeControllerBase with Store {
  GetMovieListUsecase getMovieListUsecase = GetIt.I.get<GetMovieListUsecase>();

  @observable
  ViewState viewState = ViewState.start;

  @observable
  int currentPage = 1;

  @observable
  List<MovieEntity>? movieList;

  @action
  Future<void> setMovieList() async {
    viewState = ViewState.loading;
    final response = await getMovieListUsecase.call(page: currentPage);
    response.fold(
      (l) {
        viewState = ViewState.error;
        print(l);
      },
      (r) {
        movieList = r;
        viewState = ViewState.done;
      },
    );
  }
}
