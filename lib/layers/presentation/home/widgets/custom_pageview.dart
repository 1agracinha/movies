import 'package:flutter/material.dart';
import 'package:movies/layers/domain/entities/movie_entity.dart';
import 'package:movies/layers/presentation/home/widgets/movie_card.dart';

class CustomPageView extends StatefulWidget {
  final double? height;
  final double? viewportFraction;
  final bool hasFocus;
  final List<MovieEntity> movies;
  const CustomPageView(
      {Key? key, this.height, this.viewportFraction, this.hasFocus = false, required this.movies})
      : super(key: key);

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  late PageController ctrl;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    ctrl = PageController(viewportFraction: widget.viewportFraction ?? 0.65);
    ctrl.addListener(() {
      int pos = ctrl.page!.round();
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
    return Container(
      height: widget.height ?? MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width,
      child: PageView.builder(
          controller: ctrl,
          itemCount: widget.movies.length,
          padEnds: false,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, int index) {
            // Active page
            bool active = index == currentPage;
            return MovieCard(
              isActive: widget.hasFocus ? active : false,
              isFavorited: (index % 2 == 0),
              imgUrl: widget.movies[index].posterPath,
            );
          }),
    );
  }
}
