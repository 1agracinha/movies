import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:movies/layers/data/usecases/get_genre/get_genre_list_usecase_imp.dart';
import 'package:movies/layers/domain/entities/genre_entity.dart';
import 'package:movies/layers/domain/entities/movie_entity.dart';
import 'package:movies/layers/domain/usecases/get_genres/get_genre_list_usecase.dart';
import 'package:movies/layers/domain/usecases/get_movies/get_movie_list_usecase.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

enum ViewState { start, loading, done, error }

abstract class HomeControllerBase with Store {
  GetMovieListUsecase getMovieListUsecase = GetIt.I.get<GetMovieListUsecase>();
  GetGenreListUsecase getGenreListUsecase = GetIt.I.get<GetGenreListUsecase>();

  @observable
  ViewState viewState = ViewState.start;

  @observable
  int currentPage = 1;

  @observable
  List<MovieEntity>? movieList;

  @observable
  List<GenreEntity>? genreList;

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

  @action
  Future<void> setGenreList() async {
    viewState = ViewState.loading;
    final response = await getGenreListUsecase.call();
    response.fold(
      (l) {
        viewState = ViewState.error;
        print(l);
      },
      (r) {
        genreList = r;
        viewState = ViewState.done;
      },
    );
  }
}
