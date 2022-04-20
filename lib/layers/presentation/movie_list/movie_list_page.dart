import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/core/utils/spacing_constants.dart';
import 'package:movies/layers/domain/entities/movie_entity.dart';
import 'package:movies/layers/presentation/home/controller/home_controller.dart';
import 'package:movies/layers/presentation/home/widgets/category_list_widget.dart';
import 'package:movies/layers/presentation/home/widgets/custom_elevated_button_widget.dart';
import 'package:movies/layers/presentation/home/widgets/rounded_image_card.dart';
import 'package:movies/layers/presentation/movie_details/widgets/back_button_widget.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({Key? key}) : super(key: key);

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  final HomeController homeController = GetIt.I.get<HomeController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Observer(
          builder: (context) {
            if (homeController.movieList.isEmpty) {
              return const Center(
                child: Text('no content'),
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: smSpacing,
                      top: smSpacing,
                      left: normalSpacing,
                    ),
                    child: BackButtonWidget(),
                  ),
                ),
                CategoryListWidget(genreList: homeController.genreList ?? []),
                Observer(builder: (context) {
                  return Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ...homeController.movieList
                              .map(
                                (movie) => Builder(builder: (context) {
                                  return SizedBox(
                                    height: 200,
                                    width: double.infinity,
                                    child: RoundedImageCard(
                                      isActive: false,
                                      imageUrl: getImageUrl(movie),
                                      margin: const EdgeInsets.all(smSpacing),
                                    ),
                                  );
                                }),
                              )
                              .toList(),
                          Visibility(
                            visible: homeController.hasMoreItems,
                            child: CustomElevatedButtonWidget(
                              text: 'Ver mais',
                              onPressed: () {
                                homeController.setMoreMovies();
                              },
                            ),
                            replacement: const Text(
                              'Não há mais títulos a serem carregados',
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ],
            );
          },
        ),
      ),
    );
  }

  String getImageUrl(MovieEntity movie) => homeController.movieList.isNotEmpty
      ? 'https://image.tmdb.org/t/p/w500/${movie.posterPath}'
      : '';
}
