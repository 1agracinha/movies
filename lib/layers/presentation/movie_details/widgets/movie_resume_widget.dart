import 'package:flutter/material.dart';
import 'package:movies/core/utils/spacing_constants.dart';
import 'package:movies/layers/domain/entities/movie_entity.dart';

class MovieResumeWidget extends StatelessWidget {
  final MovieEntity movieEntity;
  const MovieResumeWidget({Key? key, required this.movieEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(normalSpacing),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              title(context),
              voteAverage(),
            ],
          ),
          overview(),
        ],
      ),
    );
  }

  Widget title(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Text(
        movieEntity.title,
        style: const TextStyle(fontSize: 26),
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget voteAverage() {
    return Row(
      children: [
        const Icon(
          Icons.star_rate_rounded,
          color: Colors.yellow,
        ),
        Text(movieEntity.voteAverage.toString())
      ],
    );
  }

  Widget overview() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: normalSpacing),
        child: Text(
          movieEntity.overview.isNotEmpty
              ? movieEntity.overview
              : 'Sem sinopse!',
          style: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
