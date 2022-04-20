import 'package:flutter/material.dart';
import 'package:movies/core/utils/spacing_constants.dart';
import 'package:movies/layers/domain/entities/movie_entity.dart';
import 'package:movies/layers/presentation/movie_details/widgets/back_button_widget.dart';
import 'package:movies/layers/presentation/movie_details/widgets/image_banner_widget.dart';
import 'package:movies/layers/presentation/movie_details/widgets/movie_resume_widget.dart';

class MovieDetailPage extends StatefulWidget {
  final MovieEntity movieEntity;
  const MovieDetailPage({Key? key, required this.movieEntity})
      : super(key: key);

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                ImageBannerWidget(
                    imgUrl: widget.movieEntity.backdropPath ?? ''),
                MovieResumeWidget(movieEntity: widget.movieEntity),
              ]),
              const Positioned(
                top: normalSpacing,
                left: normalSpacing,
                child: BackButtonWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
