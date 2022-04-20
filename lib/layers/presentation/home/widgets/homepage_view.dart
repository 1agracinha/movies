import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/core/utils/spacing_constants.dart';
import 'package:movies/layers/presentation/home/controller/home_controller.dart';
import 'package:movies/layers/presentation/home/widgets/category_list_widget.dart';
import 'package:movies/layers/presentation/home/widgets/category_section_widget.dart';
import 'package:movies/layers/presentation/home/widgets/movies_pageview.dart';

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
          movieList: homeController.movieList ?? [],
        ),
        Padding(
          padding: const EdgeInsets.only(left: normalSpacing),
          child: MoviesPageView(
            hasFocus: true,
            movies: homeController.movieList!,
          ),
        ),
        CategorySectionWidget(
          sectionName: 'Drama lançado em 2022',
          onTapViewAll: () {},
        ),
        Padding(
          padding: const EdgeInsets.only(left: normalSpacing),
          child: MoviesPageView(
            height: MediaQuery.of(context).size.height * 0.22,
            viewportFraction: 0.36,
            movies: homeController.movieList!,
          ),
        ),
      ]),
    );
  }
}
