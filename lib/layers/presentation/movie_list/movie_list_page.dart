import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/core/utils/spacing_constants.dart';
import 'package:movies/layers/domain/entities/movie_entity.dart';
import 'package:movies/layers/presentation/home/controller/home_controller.dart';
import 'package:movies/layers/presentation/home/widgets/category_list_widget.dart';
import 'package:movies/layers/presentation/home/widgets/rounded_image_card.dart';
import 'package:movies/layers/presentation/movie_details/widgets/back_button_widget.dart';
import 'package:movies/layers/presentation/shared/widgets/custom_appbar_widget.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({Key? key}) : super(key: key);

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  final ScrollController _scrollController = ScrollController();

  final HomeController homeController = GetIt.I.get<HomeController>();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(
      () => homeController.updateOnScroll(_scrollController),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            controller: _scrollController,
            child: Observer(
              builder: (context) {
                if ([homeController.movieList].isEmpty) {
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
                    CategoryListWidget(
                        genreList: homeController.genreList ?? []),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: homeController.movieList
                          .map(
                            (movie) => SizedBox(
                              height: 200,
                              width: double.infinity,
                              child: RoundedImageCard(
                                isActive: false,
                                imageUrl: getImageUrl(movie),
                                margin: const EdgeInsets.all(smSpacing),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    Visibility(
                      visible:
                          homeController.viewState == ViewState.loadingNewData,
                      child: Center(
                        child: Container(
                          height: 40,
                          width: 40,
                          margin: const EdgeInsets.all(smSpacing),
                          child: const CircularProgressIndicator(),
                        ),
                      ),
                    )
                  ],
                );
              },
            )),
      ),
    );
  }

  String getImageUrl(MovieEntity movie) => homeController.movieList.isNotEmpty
      ? 'https://image.tmdb.org/t/p/w500/${movie.posterPath}'
      : '';
}
