// import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';
// import 'package:mobx/mobx.dart';
// import 'package:movies/layers/domain/usecases/get_movies/get_movie_list_usecase.dart';
// import 'package:movies/layers/presentation/home/controller/home_controller.dart';

// part 'movie_list_controller.g.dart';

// class MovieListController = MovieListControllerBase with _$MovieListController;

// abstract class MovieListControllerBase with Store {
//   GetMovieListUsecase getMovieListUsecase = GetIt.I.get<GetMovieListUsecase>();
//   HomeController homeController = GetIt.I.get<HomeController>();

//   @observable
//   bool hasMoreItems = true;

//   @observable
//   bool scrolled = false;

//   @observable
//   int page = 1;

//   @observable
//   ViewState viewState = ViewState.start;


//   @action
//   void updateOnScroll(ScrollController scrollController) {
//     if (scrollController.position.atEdge) {
//       if (scrollController.position.pixels != 0) {
//         if (hasMoreItems && !scrolled) {
//           scrolled = true;
//           viewState = ViewState.loadingNewData;
//           // getData();
//         }
//       } else {
//         scrolled = false;
//       }
//     }
//   }

//   // Future<void> setMoreMovies() {
//   //   page += 1;
//   //   setMovieList()
//   // }
// }
