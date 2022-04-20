import 'package:flutter/material.dart';
import 'package:movies/core/utils/spacing_constants.dart';

class RoundedImageCard extends StatefulWidget {
  final bool isActive;
  final String imageUrl;
  const RoundedImageCard({
    Key? key,
    required this.isActive,
    required this.imageUrl,
  }) : super(key: key);

  @override
  State<RoundedImageCard> createState() => _RoundedImageCardState();
}

class _RoundedImageCardState extends State<RoundedImageCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOutQuint,
        margin: EdgeInsets.only(
          top: widget.isActive ? 0 : smSpacing,
          bottom: normalSpacing,
          right: normalSpacing,
        ),
        decoration: getBoxDecoration,
      ),
    );
  }

  BoxDecoration get getBoxDecoration => widget.imageUrl.isNotEmpty
      ? BoxDecoration(
          color: const Color.fromARGB(255, 224, 224, 224),
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(widget.imageUrl),
          ),
          boxShadow: [getBoxShadow])
      : const BoxDecoration(color: Colors.red);

  BoxShadow get getBoxShadow => BoxShadow(
        color: Colors.black12,
        blurRadius: widget.isActive ? 6 : 0,
        offset: Offset(widget.isActive ? 10 : 0, widget.isActive ? 10 : 0),
      );
}
