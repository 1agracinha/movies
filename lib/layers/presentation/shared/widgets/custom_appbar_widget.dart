import 'package:flutter/material.dart';
import 'package:movies/core/utils/assets_constants.dart';
import 'package:movies/core/utils/spacing_constants.dart';

class CustomAppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBarWidget({Key? key}) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: mdSpacing, bottom: normalSpacing),
          child: Image.asset(
            ImageAssets.logo,
            scale: 8,
          ),
        ),
      ),
    );
  }
}
