import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/core/utils/spacing_constants.dart';
import 'package:movies/layers/presentation/home/controller/home_controller.dart';
import 'package:movies/layers/presentation/home/widgets/category_list_widget.dart';
import 'package:movies/layers/presentation/home/widgets/category_section_widget.dart';
import 'package:movies/layers/presentation/home/widgets/movies_pageview.dart';
import 'package:movies/layers/presentation/movie_list/movie_list_page.dart';

class HomePageView extends StatelessWidget {
  final HomeController homeController = GetIt.I.get<HomeController>();

  HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        CategorySectionWidget(
          sectionName: 'Explore por gêneros',
          onTapViewAll: () {},
        ),
        CategoryListWidget(
          genreList: homeController.genreList ?? [],
        ),
        Padding(
          padding: const EdgeInsets.only(left: normalSpacing),
          child: MoviesPageView(
            hasFocus: true,
            movies: homeController.movieList,
          ),
        ),
        CategorySectionWidget(
          sectionName:
              'Filmes de ${homeController.selectedGenreName} lançados em ${homeController.currentYear}',
          onTapViewAll: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: ((context) => const MovieListPage()),
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.only(left: normalSpacing),
          child: MoviesPageView(
            height: MediaQuery.of(context).size.height * 0.22,
            viewportFraction: 0.36,
            movies: homeController.currentYearMovieList!,
          ),
        ),
      ]),
    );
  }
}
