import 'package:flutter/material.dart';
import 'package:movies/core/utils/spacing_constants.dart';
import 'package:movies/layers/domain/entities/movie_entity.dart';
import 'package:movies/layers/presentation/home/widgets/category_list_widget.dart';
import 'package:movies/layers/presentation/home/widgets/category_section_widget.dart';
import 'package:movies/layers/presentation/home/widgets/movies_pageview.dart';
import 'package:shimmer/shimmer.dart';

class HomePageShimmer extends StatefulWidget {
  const HomePageShimmer({Key? key}) : super(key: key);

  @override
  State<HomePageShimmer> createState() => _HomePageShimmerState();
}

class _HomePageShimmerState extends State<HomePageShimmer> {
  @override
  Widget build(BuildContext context) {
    return homePageView();
  }

  Widget customShimmer(Widget child) {
    return Shimmer.fromColors(
      enabled: true,
      child: child,
      baseColor: const Color.fromARGB(255, 214, 214, 214),
      highlightColor: const Color.fromARGB(255, 255, 255, 255),
    );
  }

  Widget homePageView() {
    return SingleChildScrollView(
      child: Column(children: [
        CategorySectionWidget(
          sectionName: 'Explore por gêneros',
          onTapViewAll: () {},
        ),
        customShimmer(
          const CategoryListWidget(
            genreList: [],
            itemCount: 8,
          ),
        ),
        customShimmer(
          const Padding(
            padding: EdgeInsets.only(left: normalSpacing),
            child: MoviesPageView(
              itemCount: 8,
              hasFocus: true,
              movies: [],
            ),
          ),
        ),
        CategorySectionWidget(
          sectionName: 'Drama lançado em 2022',
          onTapViewAll: () {},
        ),
        customShimmer(
          Padding(
            padding: const EdgeInsets.only(left: normalSpacing),
            child: MoviesPageView(
              height: MediaQuery.of(context).size.height * 0.22,
              viewportFraction: 0.36,
              itemCount: 8,
              movies: const [],
            ),
          ),
        )
      ]),
    );
  }
}
