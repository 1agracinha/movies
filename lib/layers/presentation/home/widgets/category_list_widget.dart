import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/core/utils/spacing_constants.dart';
import 'package:movies/layers/domain/entities/genre_entity.dart';
import 'package:movies/layers/presentation/home/controller/home_controller.dart';

import 'package:movies/layers/presentation/home/widgets/custom_elevated_button.dart';

class CategoryListWidget extends StatelessWidget {
  final int? itemCount;
  final List<GenreEntity> genreList;
  final HomeController homeController = GetIt.I.get<HomeController>();

  CategoryListWidget({
    Key? key,
    required this.genreList,
    this.itemCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 46,
      margin: const EdgeInsets.all(smSpacing),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: itemCount ?? genreList.length,
        padding: const EdgeInsets.symmetric(horizontal: smSpacing),
        itemBuilder: (context, index) => CustomElevatedButton(
          text: getText(index),
          isActive: genreList.isNotEmpty ? isActive(index) : false,
          onPressed: () {
            homeController.updateGenreMovieList(genreList[index]);
          },
        ),
      ),
    );
  }

  bool isActive(int index) =>
      index ==
      genreList.indexOf(
        genreList
            .firstWhere((genre) => genre.id == homeController.selectedGenreId),
      );

  String getText(int index) =>
      genreList.isNotEmpty ? genreList[index].name : '';
}
