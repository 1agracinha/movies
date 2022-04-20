import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:movies/layers/domain/entities/genre_entity.dart';
import 'package:movies/layers/domain/entities/movie_entity.dart';
import 'package:movies/layers/domain/usecases/get_genres/get_genre_list_usecase.dart';
import 'package:movies/layers/domain/usecases/get_movies/get_movie_list_usecase.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

enum ViewState { start, loading, done, error, loadingNewData }

abstract class HomeControllerBase with Store {
  GetMovieListUsecase getMovieListUsecase = GetIt.I.get<GetMovieListUsecase>();
  GetGenreListUsecase getGenreListUsecase = GetIt.I.get<GetGenreListUsecase>();

  int currentYear = DateTime.now().year;

  @observable
  ViewState viewState = ViewState.start;

  @observable
  int currentPage = 1;

  @observable
  int? selectedGenreId;

  @observable
  String? selectedGenreName;

  @observable
  ObservableList<MovieEntity> movieList = ObservableList();

  @observable
  List<MovieEntity>? currentYearMovieList;

  @observable
  List<GenreEntity>? genreList;

  @action
  Future<void> setMovieList() async {
    if (viewState != ViewState.loadingNewData) {
      viewState = ViewState.loading;
    }
    final response =
        await getMovieListUsecase.call(genreId: selectedGenreId, page: page);
    response.fold(
      (l) {
        viewState = ViewState.error;
      },
      (r) {
        if (r.isEmpty) {
          hasMoreItems = false;
        }
        if (isANewSelectedGenrer) {
          movieList.clear();
        }
        movieList.addAll(r);
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
      },
      (r) {
        genreList = r;
        selectedGenreId = r[0].id;
        selectedGenreName = r[0].name;
        viewState = ViewState.done;
      },
    );
  }

  @action
  Future<void> loadHomePageData() async {
    await setGenreList().then((value) {
      setMovieList();
      setMoviesByGenreAndReleaseYear();
    });
  }

  @observable
  bool isANewSelectedGenrer = false;

  @action
  Future<void> updateGenreMovieList(GenreEntity genreEntity) async {
    if (selectedGenreId != genreEntity.id) {
      isANewSelectedGenrer = true;
    } else {
      isANewSelectedGenrer = false;
    }
    selectedGenreId = genreEntity.id;
    selectedGenreName = genreEntity.name;
    await setMovieList();
    setMoviesByGenreAndReleaseYear();
  }

  @action
  Future<void> setMoviesByGenreAndReleaseYear() async {
    viewState = ViewState.loading;
    final response = await getMovieListUsecase.call(
        genreId: selectedGenreId, releaseYear: currentYear, page: page);
    response.fold(
      (l) {
        viewState = ViewState.error;
      },
      (r) {
        currentYearMovieList = r;
        viewState = ViewState.done;
      },
    );
  }

  @observable
  bool hasMoreItems = true;

  @observable
  int page = 1;

  @action
  Future<void> setMoreMovies() async {
    viewState = ViewState.loadingNewData;
    if (isANewSelectedGenrer) {
      page = 1;
    } else {
      page += 1;
    }
    await setMovieList();
  }
}
