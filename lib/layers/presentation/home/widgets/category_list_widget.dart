import 'package:flutter/material.dart';
import 'package:movies/core/utils/spacing_constants.dart';
import 'package:movies/layers/domain/entities/genre_entity.dart';
import 'package:movies/layers/domain/entities/movie_entity.dart';
import 'package:movies/layers/presentation/home/widgets/custom_elevated_button.dart';

class CategoryListWidget extends StatelessWidget {
  final int? itemCount;
  final List<GenreEntity> genreList;
  const CategoryListWidget({
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
          isActive: index == 0,
          onPressed: () {},
        ),
      ),
    );
  }

  String getText(int index) =>
      genreList.isNotEmpty ? genreList[index].name : '';
}
