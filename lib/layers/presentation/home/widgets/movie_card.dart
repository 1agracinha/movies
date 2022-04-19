import 'package:flutter/material.dart';

class MovieCard extends StatefulWidget {
  final bool isActive;
  final bool isFavorited;
  final String imgUrl;
  const MovieCard({
    Key? key,
    required this.isActive,
    required this.isFavorited,
    required this.imgUrl,
  }) : super(key: key);

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOutQuint,
          margin: EdgeInsets.only(
              top: widget.isActive ? 0 : 10, bottom: 16, right: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 224, 224, 224),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://image.tmdb.org/t/p/w500/${widget.imgUrl}',
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: widget.isActive ? 6 : 0,
                  offset: Offset(
                      widget.isActive ? 10 : 0, widget.isActive ? 10 : 0),
                ),
              ]),
        ),
        Positioned(
          left: 8,
          bottom: 24,
          child: Icon(
              widget.isFavorited ? Icons.favorite : Icons.favorite_outline),
        )
      ],
    );
  }
}
