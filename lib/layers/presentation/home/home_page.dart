import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/layers/domain/usecases/get_movies/get_movie_list_usecase.dart';
import 'package:movies/layers/presentation/home/controller/home_controller.dart';
import 'package:movies/layers/presentation/home/widgets/homepage_shimmer.dart';

import 'package:movies/layers/presentation/home/widgets/homepage_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GetMovieListUsecase getMovieListUsecase = GetIt.I.get<GetMovieListUsecase>();
  HomeController homeController = GetIt.I.get<HomeController>();
  @override
  void initState() {
    super.initState();
    homeController.loadHomePageData();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (homeController.viewState == ViewState.loading) {
        return const HomePageShimmer();
      } else if (homeController.viewState == ViewState.error) {
        return const Center(
          child: Text('error'),
        );
      } else if (homeController.movieList == null) {
        return const Center(
          child: Text('no content'),
        );
      }
      return HomePageView();
    });
  }
}
