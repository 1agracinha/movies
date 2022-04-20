import 'package:flutter/material.dart';
import 'package:movies/core/utils/assets_constants.dart';

class ImageBannerWidget extends StatelessWidget {
  final String imgUrl;
  const ImageBannerWidget({Key? key, required this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.56,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        image: DecorationImage(
            fit: BoxFit.cover,
            image: imgUrl.isNotEmpty
                ? NetworkImage(
                    'https://image.tmdb.org/t/p/original/$imgUrl',
                  )
                : const AssetImage(ImageAssets.noImage) as ImageProvider),
      ),
    );
  }
}
