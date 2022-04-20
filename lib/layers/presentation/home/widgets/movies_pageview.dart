import 'package:flutter/material.dart';
import 'package:movies/layers/domain/entities/movie_entity.dart';
import 'package:movies/layers/presentation/home/widgets/rounded_image_card.dart';

class MoviesPageView extends StatefulWidget {
  final double? height;
  final double? viewportFraction;
  final bool hasFocus;
  final int? itemCount;
  final List<MovieEntity> movies;
  const MoviesPageView({
    Key? key,
    required this.movies,
    this.height,
    this.viewportFraction,
    this.hasFocus = false,
    this.itemCount,
  }) : super(key: key);

  @override
  State<MoviesPageView> createState() => _MoviesPageViewState();
}

class _MoviesPageViewState extends State<MoviesPageView> {
  late PageController pageController;
  int currentPage = 0;
  bool active = false;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      viewportFraction: widget.viewportFraction ?? 0.65,
    );
    updateCurrentPage();
  }

  void updateCurrentPage() {
    pageController.addListener(() {
      int pos = pageController.page!.round();
      if (currentPage != pos) {
        {
          setState(() {
            currentPage = pos;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width,
      child: PageView.builder(
        padEnds: false,
        controller: pageController,
        physics: const BouncingScrollPhysics(),
        itemCount: widget.itemCount ?? widget.movies.length,
        itemBuilder: (context, int index) {
          active = index == currentPage;
          return RoundedImageCard(
            isActive: hasFocus(active),
            imageUrl: getImageUrl(index),
          );
        },
      ),
    );
  }

  bool hasFocus(bool active) => widget.hasFocus ? active : false;

  String getImageUrl(int index) => widget.movies.isNotEmpty
      ? 'https://image.tmdb.org/t/p/w500/${widget.movies[index].posterPath}'
      : '';
}
